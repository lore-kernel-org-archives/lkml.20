Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F7E4EB858
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611600; cv=none; b=gdWJFRvIWNVEyTf9HnRniShLKsyvrbkvLuS9wMdR9RsPxHc5DCGYHfXkW2d2q5KnJQio/qzZYUjihWZwXU5LBraJ9y/ffMkMA1PcBmf9gi2akHCjkRecnuo6GRUwOUPwAmOCtCria971gBCqifLM9I6PoYgEqtekhUG8x1UD6f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611600; c=relaxed/simple;
	bh=2CSyBJLnBQ9egi4b1L3g/oRU+jtPQOO8FS15QFnzYGg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zmv7MmEvgclZVXFvH2nIpUwT9nYBVAGORRrTTJLnlSo6mo/M/53R4xGecEAKnbtJ2mRl367lNjmOYJ3w72q9tBGfVYBZgn7eJYIcMzSOBlGXjTp3dzTx+vDHNAyUaLJTP03udexL0GA7aMZ5bcNrhY+FlsmLOZZ3CJ3yP36mDAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=EVSlQvXr; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="EVSlQvXr"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb76ef1d0so28203591cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790611590; x=1791216390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5yDEa+qmbJcJyachLPJtnHNQFVXhnEpOITBm0Nx5uM=;
        b=EVSlQvXrO1sEM8uB0RYgysEF0Lkd8xo0+a0/5AbYYzca0o2lj0NZKZdzdRyfkdJ0Ck
         lW4TVGhFsqECTNlkfjH1dX6AQ4hzB6quLscbrehui0NUD7GWPhQdOHbFhyCFlaU7pCp4
         wuIV/vQz16drp38aQjgyvwTKZJghYmUqMr08i4+mOrkL1knhC4zhB2lkh7mFvOLFnP2T
         X2Dv67ethFS4a/PSIwgorDvKLp9A7of0V9Q7arc53Mc6pGDMtQc2hFxyaaMia+5eGbBl
         8A9HUYWHStZrhgriTgw7dnWdP+X8Y+JWmUZixs3Dy8kg6y/sdX0ocu6wWB6FBH6b/lb5
         +Tlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611590; x=1791216390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b5yDEa+qmbJcJyachLPJtnHNQFVXhnEpOITBm0Nx5uM=;
        b=QdiB9XEdL401MzcmH8yqZasVN/i+hgzEWHVA75MdOgATYgCM8f1mRmmhyhuknE5TrK
         SvZjqqeDYaFLaEO25qzJKN2SBa2c1jyqlrZgIibSDY2HG+9jr6VUh9O15lJLVEKkrMdZ
         PAXgUYwMJnE+HT2ZBWgyUQBsQVKYK9gpFBIwSHzPSAaMtBncvbvk+mKOtgrJaZhfM986
         E16MEeFD9vMjiBgOPhurRTCkPRp58Iq7qeQzJghDnnGbuWFIY1TTuX+L6REtgCEXQhVC
         YNnz199EeCsW1j3Jf6Wy3qXERpf8VXofCY6atHW8nmXoL6L5qMyCTVcsV5QFJFh03ms5
         q2dA==
X-Forwarded-Encrypted: i=1; AKwUvBy6zS/NI2OF+NBQ85kBgdB+hT3Ha+Ks8/1LS+P2eDG+DmqW68NrRPZwwpcDlZWVOlsLLGWNmxzlijB1G+Y=@vger.kernel.org
X-Gm-Message-State: AFuF++n7V6tXgIdIqNXqBiBQpDaU/EPIk4KY/+vaju1Cj7Sg3YQSjoov
	sVRUUNKdUnshJnAQHsaGajBAtXrFboE918T0zfT9xwiDqpnRX0zg6RIYAC9erLSmfI0=
X-Gm-Gg: AYBFou3gcF8Qfrm8RUewRDk7nc0gjXX+VWIiGOiRjHM0odJjgExkNKd4iCPhcuNJySo
	zuORI/9X40fisS0ikWuUuCNfZWYAttUVAn7ffMRDaD8+lHyk3i3wJUjkX74tXpMhahhs7rZDXoD
	MHcdGR5n3yPw8kng67QGPBOCpW7akRrsbngb6txA4jkWB8fQWuaxccS7JcvEJtD6lUqtHZB0JeH
	6GfjuA6lfe5t4qHKJWpkm+Kft/OS3Y6Wnmi+dYktPBk2ffGWRsd60IyWe/2NkifbPpBkLAiAZLo
	tJTqkE0oRg8xOXxOpoLjZKKbbOXpuUfZZqQW0R5wS0oFkI0VYljX07VLo0LfL277JMwgxv0lDiI
	37rYierqoJZpUxGGTm8FKGD//zzLcrUQ5ERYNcGVZL5m/CLdMGUMV/y5+XINdrmssXy6dGI8Yr+
	wyGB5W/5fpxrMdbSfamCU7g0cAqxl1nJ5K/PbuDtYdKkJ74n6d/Tg0dtJpKNKHsY4ISGlhGqZoo
	sX5AFojM/g6Lko=
X-Received: by 2002:a05:622a:4814:b0:52f:b9ad:9dad with SMTP id d75a77b69052e-5330b68c2cbmr215268241cf.36.1790611589603;
        Mon, 28 Sep 2026 09:06:29 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.255])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5332240fc16sm66398251cf.27.2026.09.28.09.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:06:28 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 28 Sep 2026 16:00:43 +0000
Subject: [PATCH 7/9] ublk: mark queues and command in one cancel_mutex hold
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-ublk-cancel-stop-v1-7-4a4360232a46@toxicpanda.com>
References: <20260928-b4-ublk-cancel-stop-v1-0-4a4360232a46@toxicpanda.com>
In-Reply-To: <20260928-b4-ublk-cancel-stop-v1-0-4a4360232a46@toxicpanda.com>
To: Ming Lei <tom.leiming@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1790611254; l=4510;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=2CSyBJLnBQ9egi4b1L3g/oRU+jtPQOO8FS15QFnzYGg=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QNrk8/Xv0BB8awotM3ZWJl80COQrBAS7HLpoXrEosgWgnjPvJXPANlN0swBi1IO/75Z3SsW7jQq
 LRtP5v80Ugg4=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

ublk_queue_rq() dispatches a request to a NULL io->cmd and the kernel
oopses when the last FETCH of a queue runs in the middle of
ublk_uring_cmd_cancel_fn(), which drops cancel_mutex between marking
the queues and marking the command:

    cancel callback                 last FETCH of the queue
    ublk_start_cancel()
      queues marked canceling
      cancel_mutex dropped
                                    ublk_mark_io_ready()
                                      queue is ready
                                      no canceled command found
                                      ->canceling = false
    ublk_cancel_cmd()
      UBLK_IO_FLAG_CANCELED set
      io->cmd = NULL, command done

ublk_queue_reset_io_flags() takes cancel_mutex for the ready
transition, so once the callback holds it across both steps the
transition comes either before or after them.

Move the locking of cancel_mutex from ublk_start_cancel() to its two
callers, and have ublk_uring_cmd_cancel_fn() claim the command with
ublk_claim_cmd() before it drops the mutex. The command is completed
after the unlock.

ublk_start_cancel() holds a reference on the disk, and dropping it used
to come after the unlock. Keep it that way by returning the reference to
the caller, the last put runs disk_release() and that should not happen
under cancel_mutex.

Fixes: 728cbac5fe21 ("ublk: move device reset into ublk_ch_release()")
Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/block/ublk_drv.c | 39 +++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 99ac56d36dd0..18046e2bf753 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -2748,11 +2748,15 @@ static void ublk_abort_queue(struct ublk_device *ub, struct ublk_queue *ubq)
 		ublk_abort_batch_queue(ub, ubq);
 }
 
-static void ublk_start_cancel(struct ublk_device *ub)
+/*
+ * Returns the disk reference it took.  The caller drops it after
+ * cancel_mutex, the last put ends up in disk_release().
+ */
+static struct gendisk *ublk_start_cancel(struct ublk_device *ub)
+	__must_hold(&ub->cancel_mutex)
 {
 	struct gendisk *disk = ublk_get_disk(ub);
 
-	mutex_lock(&ub->cancel_mutex);
 	if (ub->canceling)
 		goto out;
 
@@ -2774,8 +2778,7 @@ static void ublk_start_cancel(struct ublk_device *ub)
 		ublk_set_canceling(ub, true);
 	}
 out:
-	mutex_unlock(&ub->cancel_mutex);
-	ublk_put_disk(disk);
+	return disk;
 }
 
 /*
@@ -2900,8 +2903,13 @@ static void ublk_batch_cancel_fn(struct io_uring_cmd *cmd,
 	struct ublk_uring_cmd_pdu *pdu = ublk_get_uring_cmd_pdu(cmd);
 	struct ublk_batch_fetch_cmd *fcmd = pdu->fcmd;
 	struct ublk_queue *ubq = pdu->ubq;
+	struct ublk_device *ub = ubq->dev;
+	struct gendisk *disk;
 
-	ublk_start_cancel(ubq->dev);
+	mutex_lock(&ub->cancel_mutex);
+	disk = ublk_start_cancel(ub);
+	mutex_unlock(&ub->cancel_mutex);
+	ublk_put_disk(disk);
 
 	ublk_batch_cancel_cmd(ubq, fcmd, issue_flags);
 }
@@ -2926,7 +2934,10 @@ static void ublk_uring_cmd_cancel_fn(struct io_uring_cmd *cmd,
 {
 	struct ublk_uring_cmd_pdu *pdu = ublk_get_uring_cmd_pdu(cmd);
 	struct ublk_queue *ubq = pdu->ubq;
+	struct io_uring_cmd *claimed;
 	struct task_struct *task;
+	struct ublk_device *ub;
+	struct gendisk *disk;
 	struct ublk_io *io;
 
 	if (WARN_ON_ONCE(!ubq))
@@ -2935,15 +2946,27 @@ static void ublk_uring_cmd_cancel_fn(struct io_uring_cmd *cmd,
 	if (WARN_ON_ONCE(pdu->tag >= ubq->q_depth))
 		return;
 
+	ub = ubq->dev;
 	task = io_uring_cmd_get_task(cmd);
 	io = &ubq->ios[pdu->tag];
 	if (WARN_ON_ONCE(task && task != io->task))
 		return;
 
-	ublk_start_cancel(ubq->dev);
-
+	/*
+	 * Mark the queues and the command in one cancel_mutex section, so
+	 * that a queue getting ready meantime either finds the command
+	 * canceled or clears ->canceling first and gets marked again here.
+	 * Complete it outside, ublk_claim_cmd()'s other callers have to.
+	 */
+	mutex_lock(&ub->cancel_mutex);
+	disk = ublk_start_cancel(ub);
 	WARN_ON_ONCE(io->cmd != cmd);
-	ublk_cancel_cmd(ubq, pdu->tag, issue_flags);
+	claimed = ublk_claim_cmd(ubq, pdu->tag);
+	mutex_unlock(&ub->cancel_mutex);
+	ublk_put_disk(disk);
+
+	if (claimed)
+		io_uring_cmd_done(claimed, UBLK_IO_RES_ABORT, issue_flags);
 }
 
 static inline bool ublk_queue_ready(const struct ublk_queue *ubq)

-- 
2.55.0

