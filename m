Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199F94E73CC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 16:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790611444; cv=none; b=sZiaPhiOeptJLOGZAd4N42zUJB5c9uxDItutrbue5o0uiGm6uOlT97k/sgGgBRVtTbWLJGodj7pkbkysxPWt+uLXMzxBH1ELphmlcBRKU2dl73HsTOpWvUfNpzCP2Rxw/cXI/RWkLMFAk2pXGWsVxFbcYeJRnLlECeAKB3HXjiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790611444; c=relaxed/simple;
	bh=13zZY4Ggnuip4DrDOLcMdPtQG3oZ/6uaeB0rBskJ5Bw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RyS7lZ1VFo/Q9zETPeq60tsasSmNnLQFm3jsZpHaDtQ75GF8VdLlOcukdba3ck2nzEXoR8D6IsfqWYCY5p8JYQ+ms/GSqFkzw1BhJnC2sJGJ9PWOETOPrSS1DxWmBC8riuRBDU2Up+0e4EoprLAY1kXDvaZHiaLU8OyYnD1TqFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=dftKas/d; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="dftKas/d"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-91434eba57fso24409436d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1790611442; x=1791216242; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kxKaEX5KPsMqVvctMrRT+/IR2cK71V7y+Zr8xW+kYCI=;
        b=dftKas/dbC+CA/gxI3t1/zu1dw2DcdLITfVH/SyuJvLSYV6Br9rrCN52zcx+tk+E43
         BR4MlrDVFmDdozKsEa4sG3YEihdEkP68Cn0CJk7l5apUojcJRIwS7LPdPQ6wq9l9TVAc
         pkxmjfKH88m/bTFXhPJSf3zc4HahXZ4FJDURlwEiaoUIip8PPyQHRSQVsRiLesT9K8zF
         MUK4eOXDBJwHcfNF3cn9r2WG2fG8i2sWhPZtaRghzSMa4k0pSBg8rueCpNbkrCe7yfaS
         yjIOhKLy8ZOmJRGnaf79F2+etZ1QY5XvbvTlJHrom7yNOeuEWLgXTHN8TLAjTThP+RQX
         b6wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790611442; x=1791216242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kxKaEX5KPsMqVvctMrRT+/IR2cK71V7y+Zr8xW+kYCI=;
        b=BB9807siOrVPHnxBE9B20Fpe3fujkaA+ubv5an72JYAXOTNKaCXBgSulPOi1AmXPwX
         nJQXCi0IoUrdl+OPN4eeS3dKLgb6D4drCGaRUQEuAP1o3gR2JYomCRMKV6eKa2PdF1ER
         0rIPq2Cd662WbkG4u3LHZrKq7xydTPJUOBztaqmu7GxI5rAoHxs+GQEPEugZ4bndYJ7P
         OdtpOd4h5Lr+cCwngqK8JIA126qKKqhGM74Mtd8nAMnL8kUlvb/mF3S3NfQafXx1SEAq
         cZN4mxLaw12SmtfzqsHJqp25VXBfWb5lFtoqG6tQqY+ZsDjoEQ3atGrAPVVAJmkNNJrO
         nlKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwPoBYWyL7ItmjuITG6PLz9sTQTcd7IaE8S6eaoH9LuQ4d6k9uQ41wF5dUVC8qfhnQVVGPJaxtZcedt6uQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nH8YzOAeaKDtaCoposeAlL+SjMxUuDMnGPP4L1nVTMptjfTkw1
	DZri/7pqFiyqsCQn3B43aPL23V5Ltq7WSHmcLNc002td6Q5FEpNorY/L1M9OH7M2n+M=
X-Gm-Gg: AYBFou10zDvr6uGj7ojWq5embKSxSKNwgB827K8oUkcDqvywWJ5d33LCruhP7nMNpFD
	t/svUgjZXYp6xjUKWfLqJZPGw6AgFAL0GJ/dXEW60AoG2PmizW1oWSDyPGP1Y7v0ZPFqzk0TL3q
	bd+OSCCZtZVLLJCz0Y4z5gH6CCcNuRSayijWDs6BUDOZYtoOb+NYVVmiQwjSEBtVbyTJgKE6PiS
	WP7sjCaguC3C+6GIYGlIDLtd4Gkad+iPbJAGiey7N4VGAYiiYNAzOxX4iXZiG6TH+vC3WKhcldU
	f3gc7JsnEP3DVAnSQxk0deJVE1c5ppOTgFe8+LAF1k4PFrTD78HWsQLToDnegAoFaJA8EPe1fy6
	FalFLOZLtXXvm8Nqw3pXqFJccFr46YlRzNmDfjyPJnktIIUgsu4OXWVxd21vCNVHfrW9ZRJ1ME6
	JK8P6RNRo156/YksBh9Kc656LnAqsxOTOpmGeiaAXs8Kcd
X-Received: by 2002:a05:6214:5345:b0:912:4ae8:5512 with SMTP id 6a1803df08f44-9142f635c6amr188557206d6.3.1790611441860;
        Mon, 28 Sep 2026 09:04:01 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.244])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91430da9123sm83309486d6.16.2026.09.28.09.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 09:04:00 -0700 (PDT)
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 28 Sep 2026 16:00:40 +0000
Subject: [PATCH 4/9] ublk: read the io under io->lock in ublk_cancel_cmd()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260928-b4-ublk-cancel-stop-v1-4-4a4360232a46@toxicpanda.com>
References: <20260928-b4-ublk-cancel-stop-v1-0-4a4360232a46@toxicpanda.com>
In-Reply-To: <20260928-b4-ublk-cancel-stop-v1-0-4a4360232a46@toxicpanda.com>
To: Ming Lei <tom.leiming@gmail.com>, Jens Axboe <axboe@kernel.dk>, 
 Caleb Sander Mateos <csander@purestorage.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openssh-sha256; t=1790611254; l=2798;
 i=josef@toxicpanda.com; h=from:subject:message-id;
 bh=13zZY4Ggnuip4DrDOLcMdPtQG3oZ/6uaeB0rBskJ5Bw=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgUBr36M/n0nWN0DNbnxwzIiCZez6MG
 JiruuNaSCI/zXsAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QEGImZtzgMNKkqqTM0dIb+5lBVrtd5qqYMy3AoeQNis0pwIYB5oPHW2sF9wRq4da60XrIo3MVrg
 8+mmWL4TvTQs=
X-Developer-Key: i=josef@toxicpanda.com; a=openssh;
 fpr=SHA256:C8kOX2QUJCMqnCX+KEeoqRAjLo9L+ELOSH2NSAJHqGA

ublk_cancel_cmd() looks at three things before it takes a command: the
io is active, the request of its tag is not started, and the io was not
canceled before. Only the last one is read under a lock.

Since the previous patch ublk_fill_io_cmd() sets io->cmd and
UBLK_IO_FLAG_ACTIVE under io->lock. Take io->lock in ublk_cancel_cmd()
around all three checks and the read of io->cmd, so that a cancel from
the control path either finds the io not active or finds the command
which was stored with the flag.

The request check belongs in the same section. COMMIT_AND_FETCH ends
the request it commits after it has stored the new command. A cancel
which finds that request idle holds io->lock at that point, so it runs
after ublk_fill_io_cmd() dropped it and reads the new command, not the
request pointer which was in the union before.

Requests cannot be dispatched to the io meanwhile, every caller has the
queue marked as canceling or the disk deleted, so the dispatch side does
not need the lock.

ubq->cancel_lock nests inside of io->lock, as it does for
ublk_batch_prep_io() already.

Assisted-by: LLM
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
 drivers/block/ublk_drv.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 17a33539f271..1455ce27d3d1 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -2777,10 +2777,16 @@ static void ublk_cancel_cmd(struct ublk_queue *ubq, u16 tag,
 	struct ublk_device *ub = ubq->dev;
 	struct io_uring_cmd *cmd = NULL;
 	struct request *req;
-	bool done;
 
+	/*
+	 * ublk_fill_io_cmd() runs under io->lock, so either the io is not
+	 * active yet or its command is in io->cmd.  The request the command
+	 * was committed for is ended after that, check it in here as well, so
+	 * that one seen idle goes with the command fetched for the next one.
+	 */
+	ublk_io_lock(io);
 	if (!(io->flags & UBLK_IO_FLAG_ACTIVE))
-		return;
+		goto unlock;
 
 	/*
 	 * Don't try to cancel this command if the request is started for
@@ -2794,18 +2800,19 @@ static void ublk_cancel_cmd(struct ublk_queue *ubq, u16 tag,
 	 */
 	req = blk_mq_tag_to_rq(ub->tag_set.tags[ubq->q_id], tag);
 	if (req && blk_mq_request_started(req) && req->tag == tag)
-		return;
+		goto unlock;
 
 	spin_lock(&ubq->cancel_lock);
-	done = !!(io->flags & UBLK_IO_FLAG_CANCELED);
-	if (!done) {
+	if (!(io->flags & UBLK_IO_FLAG_CANCELED)) {
 		io->flags |= UBLK_IO_FLAG_CANCELED;
 		cmd = io->cmd;
 		io->cmd = NULL;
 	}
 	spin_unlock(&ubq->cancel_lock);
+unlock:
+	ublk_io_unlock(io);
 
-	if (!done && cmd)
+	if (cmd)
 		io_uring_cmd_done(cmd, UBLK_IO_RES_ABORT, issue_flags);
 }
 

-- 
2.55.0

