Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467844E73DA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611518; cv=none; b=Imt7dKTqxrlDPPaY4eUAv5+irmpbEUgG1PRfRy7uw8K/ybGxOHlGWeYFRqEoSk4NdUmbtFywMZdEjDbiW4DhN+JBvXH6QQHBvI7RiH0feMpswUJXFe+3E9O8GuGGgNA3662nlhHvczCsdYOgt5utSRUJh27Bkh1z10PqgF91j7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611518; c=relaxed/simple;
	bh=okUdNTs9dA4drHjisOFlb7BolHtlKtc1Z2Oya10d9gk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q05iA6A9MwQyfVCIWo0IQenmIEdRfKQFxJS9HENnjm9qLWSY+chWM2fUUozhgGrqKGsTrJeic4pXYBKVJ/zKJDFvukng6rbtP212qwLyafyXuVGQbRU8uf5Dcfv7lgWBOHFzzHMxEeceQ//olZ84vnTIJe+1tJVeIkWlS0GMaWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=Kv7jKSfk; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="Kv7jKSfk"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-53320dc09fcso17902621cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790611516; x=1791216316; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wul9yIPNTdTMZM3NLxXfYZpaiEbCYhYod4k15fzruB0=;
        b=Kv7jKSfkVkhaVWutBIvej4+nmiUTGFwlTwCUbsX4KLC/gF2iXiaCTnf79P8s7s6Amb
         PV+BYxx1AURoYblgXIbSbWBf7jpatreZrAi0qB/1OPViFPNNzYHdIlKuQslE32mZ9Y+q
         Jrfl1ojXTD6pCHN7i56kd6Yi7ap1JB44Ta8FoqBgi1znrcTJbY12TiWCvOyOKQH1jgtV
         wsHtxabiwXHWWj5xMfiHktS0omH6kNP3w8bVKBP86TJj2Fcks3HJo9QbxKVfM3FFK1oZ
         htIIzN+NEZ/DTtlipD7x1BDiTEQYOrRQxswO7M3JXEMbe8fUFQhBvQOcO4N4YMnscLIb
         QEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611516; x=1791216316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wul9yIPNTdTMZM3NLxXfYZpaiEbCYhYod4k15fzruB0=;
        b=X/ArPOusvlTltXTnmXOjp/CKH3Q0qn9tROymkw0WShNzX0mavyCmhMDOAcpz0F7qcM
         rLz7e59UlQixd4Wjvr98Y3Efgq4KlUDRDMAXp9CvkVmC2Girw2ntyScobdary4Ffr3eR
         3P7HYWk2x2dY7xrqJLRxjSTjGs5zuRrczwNW40pX/90Zurlnywgrak00f/rrtHrRt/Hu
         DtL54YNkXs7BGuAC9NRs0lqBJpQK2i6rPwT35ub+hjR5iCvm/hL9D9UBvAKZbIwAMNrZ
         XgiNiLj0TsDiYEEjiQ8EYHhRVm79PZscRSyTZ7ObDFpkbHdvdJd5Js7o9U8AuK/d6Hu2
         Iohg==
X-Forwarded-Encrypted: i=1; AKwUvBylvYykRbYjHJhAxC/n2uNd/c2qQrilVGch0KQhjBRKb5OnFYU5m0sQPuEbB3R1iscK2TCDw7CImdmyNdU=@vger.kernel.org
X-Gm-Message-State: AFuF++nPIavwGRlhDvf90DlOGSz9mS9iIetrPtzXYlT2ZNAMYXdBTSWW
	kSnmGkhgIzP3RTc2QM0bnNxG7qSgkbW7Z7E39Jge8mJoIfG0T8Ka6ygp42AGLEEZTJg=
X-Gm-Gg: AYBFou0X1+21oFrmiq38osMTaSUfFfjr4XwB9x/aGLTUFIVspdskbM9YOznh7Yz/RIL
	LZtpfZlg2hoPX6rRinM2pMCmtiWKbVvpJ5WZ/0FN1W398+B7ZCbbbo7ck/I0KNWOapvM4lob7Co
	LZ2gbQ9NVHY5peMkTivKgntv8zixmo2JQ4ebo6O0KfNfb1p+i3Jcmft/Is+ivFekpCyYVoUZfg8
	KNlVD0yUlVpXshf5mURLk2tcw4dTdJJPk+uPL6YHSUEhHeXjHIPbdIOP/btZjHWvY2Kaw4ocb4B
	UDuesaMadFK0QZ8AUoSrlk5rXZSfZ7mBwJBB8AC7VHm7HvP2qF5fRXCkc90jHDMcF0Bf8Y+7lWF
	uzUIuxplEWyutYxYXlSq1NjCNiS/AsUOi9dy0YxnQc8IbptB61sczcp6UIK1A1/XjOhdI1Vhujm
	nAVePL8f3ImBB6FXGP5fgdpJAx5cbKPf9yhnJVsNKB2lNGCC+CdFwQpqRKopS6J01UDTuXaT+CM
	FIxcz6oyqHbrSd+
X-Received: by 2002:a05:622a:1450:b0:530:e6b9:f5d3 with SMTP id d75a77b69052e-5330b6c9b3bmr219442201cf.48.1790611515925;
        Mon, 28 Sep 2026 09:05:15 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.244])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5332242ae75sm66505491cf.29.2026.09.28.09.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:05:14 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 28 Sep 2026 16:00:41 +0000
Subject: [PATCH 5/9] ublk: complete a command canceled before it was marked
 from its issuer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-ublk-cancel-stop-v1-5-4a4360232a46@toxicpanda.com>
References: <20260928-b4-ublk-cancel-stop-v1-0-4a4360232a46@toxicpanda.com>
In-Reply-To: <20260928-b4-ublk-cancel-stop-v1-0-4a4360232a46@toxicpanda.com>
To: Ming Lei <tom.leiming@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1790611254; l=4736;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=okUdNTs9dA4drHjisOFlb7BolHtlKtc1Z2Oya10d9gk=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QAu0UigM1OH8sDBZOPQ6qCdR6x7tT9iOK82+3zbZFrUSbXXmPCmWYUDr7s3K6eA0ecIrTHOr8xe
 nqYYHdJ3KCAg=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

The issue paths store the command in io->cmd first and call
ublk_prep_cancel() on their way out, which is where io_uring puts the
command on its list of cancelable commands. The io_uring cancel callback
only ever sees commands from that list. A cancel from the control path
finds the command in io->cmd as soon as it is stored, and can complete it
before it is marked:

    issue path                      control path
    ublk_fill_io_cmd()
                                    ublk_cancel_cmd()
                                      io_uring_cmd_done()
                                        not cancelable, nothing to remove
    ublk_prep_cancel()
      io_uring_cmd_mark_cancelable()
        adds the completed request to the list

Leaving such a command alone is no better. FETCH, COMMIT_AND_FETCH and
NEED_GET_DATA queue it right after, no cancel may come after the one
which skipped it, and a server waits for all its commands before it
exits.

Fix by taking the command off the io all the same in ublk_cancel_cmd(),
but setting UBLK_IO_FLAG_CANCEL_DEFERRED instead of completing it, and
by having the issue path look for that flag under io->lock once
ublk_prep_cancel() has marked the command, and complete the command with
UBLK_IO_RES_ABORT then. A cancel which takes io->lock after that sees
the marking and completes the command itself.

IORING_URING_CMD_CANCELABLE is not one of the flags the server passes in
the SQE. It is a bit io_uring keeps for itself in the same word of its
own copy of the command: io_uring_cmd_mark_cancelable() sets it and
io_uring_cmd_done() clears it, both with uring_lock held. The control
path does not hold uring_lock, so read the word with READ_ONCE().

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/block/ublk_drv.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 1455ce27d3d1..2ff6506b8664 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -191,6 +191,14 @@ struct ublk_batch_io_data {
 /* atomic RW with ubq->cancel_lock */
 #define UBLK_IO_FLAG_CANCELED	0x80000000
 
+/*
+ * Set next to UBLK_IO_FLAG_CANCELED by a cancel which took a command
+ * before io_uring marked it cancelable, the issue path completes the
+ * command then, see ublk_take_canceled_cmd().  Set and cleared under
+ * io->lock.
+ */
+#define UBLK_IO_FLAG_CANCEL_DEFERRED	0x40000000
+
 /*
  * Initialize refcount to a large number to include any registered buffers.
  * UBLK_IO_COMMIT_AND_FETCH_REQ will release these references minus those for
@@ -2807,6 +2815,17 @@ static void ublk_cancel_cmd(struct ublk_queue *ubq, u16 tag,
 		io->flags |= UBLK_IO_FLAG_CANCELED;
 		cmd = io->cmd;
 		io->cmd = NULL;
+		/*
+		 * The issue path stores the command before ublk_prep_cancel()
+		 * marks it cancelable, and completing it in between would
+		 * leave a completed request on io_uring's list of cancelable
+		 * commands.  Leave the completion to the issue path then, it
+		 * looks for this once the command is marked.
+		 */
+		if (!(READ_ONCE(cmd->flags) & IORING_URING_CMD_CANCELABLE)) {
+			io->flags |= UBLK_IO_FLAG_CANCEL_DEFERRED;
+			cmd = NULL;
+		}
 	}
 	spin_unlock(&ubq->cancel_lock);
 unlock:
@@ -3202,6 +3221,24 @@ static inline void ublk_prep_cancel(struct io_uring_cmd *cmd,
 	io_uring_cmd_mark_cancelable(cmd, issue_flags);
 }
 
+/*
+ * Called by the issue path after ublk_prep_cancel(): a cancel which found
+ * the command before it was marked took it off the io and left completing
+ * it here.  io->lock orders this against ublk_cancel_cmd(), which sees the
+ * marking if it runs after this, and completes the command itself then.
+ */
+static bool ublk_take_canceled_cmd(struct ublk_io *io)
+{
+	bool canceled;
+
+	ublk_io_lock(io);
+	canceled = io->flags & UBLK_IO_FLAG_CANCEL_DEFERRED;
+	io->flags &= ~UBLK_IO_FLAG_CANCEL_DEFERRED;
+	ublk_io_unlock(io);
+
+	return canceled;
+}
+
 static void ublk_io_release(void *priv)
 {
 	struct request *rq = priv;
@@ -3466,6 +3503,8 @@ static int ublk_ch_uring_cmd_local(struct io_uring_cmd *cmd,
 			goto out;
 
 		ublk_prep_cancel(cmd, issue_flags, ubq, tag);
+		if (ublk_take_canceled_cmd(io))
+			io_uring_cmd_done(cmd, UBLK_IO_RES_ABORT, issue_flags);
 		return -EIOCBQUEUED;
 	}
 
@@ -3542,6 +3581,8 @@ static int ublk_ch_uring_cmd_local(struct io_uring_cmd *cmd,
 		goto out;
 	}
 	ublk_prep_cancel(cmd, issue_flags, ubq, tag);
+	if (ublk_take_canceled_cmd(io))
+		io_uring_cmd_done(cmd, UBLK_IO_RES_ABORT, issue_flags);
 	return -EIOCBQUEUED;
 
  out:

-- 
2.55.0

