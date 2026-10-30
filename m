Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793379052;
	b=FC46f0ZlCB5cAJuJP6onbAa1r15x1PmmeHAazXPiPDuEzi+/ZR73u0tenCxL1ilvYvuf
	 fJtUXK2Cas1iUDmwb5ESHALMjwOGd+a7Ve3FqQRbVOFXk3hHH9uAB9pbBGc/byjjQTlvS
	 AcsdoSPhwLx0peP4a4mfJnTLdecg55uZbECkTvyFcKzwbSObkgY901XmhF9LxmhX4Nj1t
	 nLLF42Ay3ET251JZHKjEfzIsJpHaWYxl3GL+PzygZZR5Jq0RjPUJdB2rY5iwDdCafX0rq
	 vzbFIqJYEoD3gdgC20sv/yJFiB6TNBFzYtXquoIRCjMANXD3eMUg+bYNd3CrFKxPYfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793379052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=VpbQlCytsv1cg6858cBTxgtsh/VbD6xq9Rg5icB9Yi4=;
	b=1Xlyk8oQ5+w9taEafs8aR4TChl1f54wmp6h9nsWLTxKk6DhZm7dqN3phOhIdYkafCy1l
	 H6Wg4cYpYXBWQ1RZjsJh7M992vHTTJGpHwM4NnSPKVRuhZEN/8amlcZph5x/B+MLVcnkM
	 QJIxFBCDeGc2CQ+oePjvTairAiyXrqTPUBD7UcgmIKmOIUKIPVmmH/tlTnOtb+o/CSsd1
	 YuI7UDmAaFS880QhwG+qMUe1AsuaXW/C1590mS4KHyDqhvC+lZEvypqECCnvcdDVP5tkK
	 10Pq0Ex4E37EezPPwoxrenChxd2EMkCawWEM/aSsK3auiuHUDAylbw62xVDGAQxhjQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BRuocEKQ;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EA4606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05EA4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BRuocEKQ
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1000604f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793379049; x=1793983849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VpbQlCytsv1cg6858cBTxgtsh/VbD6xq9Rg5icB9Yi4=;
        b=BRuocEKQpARVKDXWjLe1jzPGzMJ1nV9FV0UlA82a7VAp6QNpWgKwLsn/kCYn0yeYi0
         WrFkO/nRKzn2S7KwLtQaUwtoczBKhZAvPNi8uua6PdSKpU4/EpEYqvcSm2P3/aDVk279
         Q/HsWaipJLwdgBRIfpq6dj+tGENjLG0BjHTCzFByYTbtfG7S36NaC4Ynj89+7B6d7Cqe
         vZguv/e6JSDKIfkXG/huHu0UyukVM2wHqd0FtIS4Xl6xlA82j9HIO+6/PTQ5o/hfC25v
         bBT+8npk7K9WePGigdavszUVnmiVNqgvLYTLvR6k4mlTfsM/m6KPG7eBmx7NwwyxiBry
         9o7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793379049; x=1793983849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VpbQlCytsv1cg6858cBTxgtsh/VbD6xq9Rg5icB9Yi4=;
        b=U7P30OrXf1jS731o+PV5IuOBtM6/v+XHmeUXSwcJCMamjAmPUA4XuQoQw18+vuM6M4
         dtK0OdI3Srbi+YnekdnZybyXwuvqhwvQ//2dsDbh4HxmYVuhMs1hA/21idCiIguftG7H
         XcM9sMrHNaCa5M2yvR1X2P6UrJNQbLI8Cd/Dcgd7q6D9LbGu2ENufA+M6dBZxU5lD6Ix
         gljt1HJum6MC443bi+HRgyNMkMGHNZnh9kbPxspGp0czb6ZtGFw9eqRmWAN1Bm9mEN8/
         11rze4erctz9fJhN2vrPYrUu3K5w+FhYRUGz2XSqB8cv36tki5HiWrA8ubR3hSifJ5Ec
         3Z/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwGoiujqOIvJdjba9DUqBm9MFSf44vjLQrbGW+MTvCVldXitFmQrTjMXVEVOSDK9omXKmEfzPRxJ/baqaA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfgEfWQrie7GJwFfeR2GYSY85QKdjkw/doQ5rPacrOttiPBEfT
	Eug8Q9R2QGOMBkxShKheEu+HCkEfyavg5DZETdL1se0uv9Oy4eLShkA=
X-Gm-Gg: AYBFou0bNfNIdkJwcYFAK5q0VD/6JyLUvBFFxa4TKmgNo4yoxE2YeOVf0uiUzFn8gwV
	O4DQLhz7Ki6eIihQzPkTL4ZcAHT/zeldSpernB5COpdKSqs0XdiqmpkE5Mz9UZ8dkwHtIsACrQ2
	Dc/a71+jfHjWAiy+QfhwBlBRLh4TwndMN5pUYYiXMlypuYREympZZgBANGVnf2vrpeSyWGco8N7
	/mDhlU8DzLkkR9iNtP8jGZwXP75aUnzPwC3KIWh5Mx5AikaNp+hd9wrFSRILOB4TxjV7jxj6zO5
	dN2kEwxqqDcz/CVwcer/E9qYbXBG/Hrmj0XkCejLv1bZp4WGAqduAEgK9FecBj2hO0AJicoq4Mz
	xFpJHoiALOFnWaGUdnzaJLuvvOi3yXiWVqK4RZ5tDqFMmTLpmY/m9ibt7bH9+cfWf2DgbmNlbU0
	RGQTn2tCcZfRyL3CtpmzbsyZvg4XKfY5iRENsarnMCY56TlufmpHnR6/igvU06G1NCHFJ8Wv2MU
	ICv8bGfQh6clWm8W+rA4qMfcO4uoLpTTv7rJO6vybWUFiTmpCQsFdd88BZj1Ft/YrOGW2BW92fa
	qD8k+R+zOW7KnvfjQH9EiSx+aGtXmID9
X-Received: by 2002:a05:600c:3547:b0:4a1:e69d:90e8 with SMTP id 5b1f17b1804b1-4ac1889d442mr65975905e9.22.1793379049059;
        Fri, 30 Oct 2026 09:50:49 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf6e63e0esm94366765e9.12.2026.10.30.09.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:50:47 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v8 1/2] RDMA/rxe: copy send WQE to kernel buffer before processing
Date: Fri, 30 Oct 2026 16:50:43 +0000
Message-ID: <20261030165044.2799619-2-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030165044.2799619-1-tristan@talencesecurity.com>
References: <20261030165044.2799619-1-tristan@talencesecurity.com>
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

The rxe send queue is mapped into userspace via mmap. The requester
processes Work Queue Entries (WQEs) directly from this shared buffer
without first copying them to kernel memory. Userspace can modify WQE
fields (num_sge, sge_offset, SGE entries) between kernel reads,
leading to inconsistent state in copy_data().

This is the send-path counterpart to the receive-path fixes:
  - commit 22b8fbded65b8 ("RDMA/rxe: Fix TOCTOU heap overflow in
    get_srq_wqe")
  - commit d6ab440240a04 ("RDMA/rxe: Copy WQE to local buffer in
    non-SRQ receive path")

Fix by copying the send WQE to a kernel-private buffer in req_next_wqe()
before processing. The copy uses the full queue element data size
(max of max_sge SGEs and max_inline bytes) so that both SGE entries
and inline data are always captured.

After copying, reject out-of-range opcodes and oversized atomic write
residuals by setting mask to 0 so that next_opcode() transitions the
QP to error state through the normal error path. This covers all valid
opcodes up to IB_WR_REG_MR while preventing OOB access in both the
wr_opcode_mask() lookup table and finish_packet() for atomic writes.

The local copy is reused across multi-packet sends to preserve DMA
progress state (cur_sge, sge_offset, resid). Field updates including
DMA progress are written back to the shared queue using WRITE_ONCE()
for individual fields and smp_store_release() for state transitions,
so the completer and userspace observe consistent values without the
tearing risk of bulk memcpy(). DMA progress writeback ensures retries
can resume from the correct offset.

The copy is invalidated when the WQE index advances (last packet sent,
error, local ops, UD oversized), when a retry resets WQE state, on QP
reset, or when the QP enters error state for flush.

Fixes: 8700e3e7c485 ("Soft RoCE driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---

Changes since v7:
  - Reject atomic write WQEs with oversized dma.resid to prevent
    OOB read in finish_packet() (sashiko finding).

Changes since v6:
  - Fixed all sashiko review findings (2 Critical + 9 High).
  - FORTIFY_SOURCE: memcpy into enclosing struct, not inner member.
  - Copy size: max(max_sge * sizeof(ib_sge), max_inline).
  - Opcode bound: IB_WR_REG_MR (was IB_WR_ATOMIC_WRITE).
  - Removed silent num_sge clamp, use mask=0 for invalid opcodes.
  - DMA progress writeback (resid, cur_sge, sge_offset).
  - Addressed Zhu Yanjun review feedback.

Changes since v5:
  - Added opcode bounds check and num_sge clamp after copy.

Changes since v4:
  - Resent from the correct sender address.

Changes since v3:
  - Copy full queue element (max_sge SGEs) instead of per-WQE size.
  - Invalidate on QP reset, ERR flush, RESET state check.

Changes since v2:
  - WRITE_ONCE/smp_store_release for field writeback.

Changes since v1:
  - Split into per-path patches. Cache across multi-packet ops.
---
 drivers/infiniband/sw/rxe/rxe_qp.c    |  1 +
 drivers/infiniband/sw/rxe/rxe_req.c   | 71 +++++++++++++++++++++++++--
 drivers/infiniband/sw/rxe/rxe_verbs.h |  6 +++
 3 files changed, 73 insertions(+), 5 deletions(-)

diff --git a/drivers/infiniband/sw/rxe/rxe_qp.c b/drivers/infiniband/sw/rxe/rxe_qp.c
index 311f285d78a6b..77606c4a039b1 100644
--- a/drivers/infiniband/sw/rxe/rxe_qp.c
+++ b/drivers/infiniband/sw/rxe/rxe_qp.c
@@ -581,6 +581,7 @@ static void rxe_qp_reset(struct rxe_qp *qp)
 	qp->req.need_retry = 0;
 	qp->req.wait_for_rnr_timer = 0;
 	qp->req.noack_pkts = 0;
+	qp->req.send_wqe_valid = false;
 	qp->resp.msn = 0;
 	qp->resp.opcode = -1;
 	qp->resp.drop_msg = 0;
diff --git a/drivers/infiniband/sw/rxe/rxe_req.c b/drivers/infiniband/sw/rxe/rxe_req.c
index 24f5c044363f7..d5a0c46eb8a25 100644
--- a/drivers/infiniband/sw/rxe/rxe_req.c
+++ b/drivers/infiniband/sw/rxe/rxe_req.c
@@ -161,6 +161,26 @@ static void req_check_sq_drain_done(struct rxe_qp *qp)
 	spin_unlock_irqrestore(&qp->state_lock, flags);
 }
 
+static void rxe_req_writeback_wqe(struct rxe_qp *qp)
+{
+	struct rxe_send_wqe *shared = qp->req.shared_wqe;
+	struct rxe_send_wqe *local = &qp->req.send_wqe.wqe;
+
+	if (!qp->req.send_wqe_valid || !shared)
+		return;
+
+	WRITE_ONCE(shared->status, local->status);
+	WRITE_ONCE(shared->first_psn, local->first_psn);
+	WRITE_ONCE(shared->last_psn, local->last_psn);
+	WRITE_ONCE(shared->mask, local->mask);
+	WRITE_ONCE(shared->has_rd_atomic, local->has_rd_atomic);
+	WRITE_ONCE(shared->dma.resid, local->dma.resid);
+	WRITE_ONCE(shared->dma.cur_sge, local->dma.cur_sge);
+	WRITE_ONCE(shared->dma.sge_offset, local->dma.sge_offset);
+	/* State must be last so the completer sees prior updates */
+	smp_store_release(&shared->state, local->state);
+}
+
 static struct rxe_send_wqe *__req_next_wqe(struct rxe_qp *qp)
 {
 	struct rxe_queue *q = qp->sq.queue;
@@ -193,7 +213,35 @@ static struct rxe_send_wqe *req_next_wqe(struct rxe_qp *qp)
 	}
 	spin_unlock_irqrestore(&qp->state_lock, flags);
 
-	wqe->mask = wr_opcode_mask(wqe->wr.opcode, qp);
+	/* Reuse the existing kernel-private copy if still valid */
+	if (qp->req.send_wqe_valid && qp->req.shared_wqe == wqe)
+		return &qp->req.send_wqe.wqe;
+
+	/* Copy WQE from userspace-mapped shared queue to kernel-private
+	 * buffer. Copy size matches the queue element data area.
+	 */
+	memcpy(&qp->req.send_wqe, wqe, sizeof(*wqe) +
+	       max_t(int, qp->sq.max_sge * sizeof(struct ib_sge),
+		    qp->sq.max_inline));
+	qp->req.shared_wqe = wqe;
+	qp->req.send_wqe_valid = true;
+
+	wqe = &qp->req.send_wqe.wqe;
+
+	/* Prevent OOB in wr_opcode_mask() for corrupted opcodes.
+	 * Mask 0 causes next_opcode() to fail, moving QP to error state.
+	 */
+	if (unlikely(wqe->wr.opcode > IB_WR_REG_MR))
+		wqe->mask = 0;
+	else
+		wqe->mask = wr_opcode_mask(wqe->wr.opcode, qp);
+
+	/* Atomic writes carry exactly sizeof(u64) payload.
+	 * Reject oversized resid to prevent OOB read in finish_packet().
+	 */
+	if (unlikely((wqe->mask & RXE_ATOMIC_WRITE_MASK) &&
+		     wqe->dma.resid > sizeof(u64)))
+		wqe->mask = 0;
 	return wqe;
 }
 
@@ -582,9 +630,13 @@ static void update_state(struct rxe_qp *qp, struct rxe_pkt_info *pkt)
 {
 	qp->req.opcode = pkt->opcode;
 
-	if (pkt->mask & RXE_END_MASK)
+	rxe_req_writeback_wqe(qp);
+
+	if (pkt->mask & RXE_END_MASK) {
 		qp->req.wqe_index = queue_next_index(qp->sq.queue,
 						     qp->req.wqe_index);
+		qp->req.send_wqe_valid = false;
+	}
 
 	qp->need_req_skb = 0;
 
@@ -634,7 +686,9 @@ static int rxe_do_local_ops(struct rxe_qp *qp, struct rxe_send_wqe *wqe)
 
 	wqe->state = wqe_state_done;
 	wqe->status = IB_WC_SUCCESS;
+	rxe_req_writeback_wqe(qp);
 	qp->req.wqe_index = queue_next_index(qp->sq.queue, qp->req.wqe_index);
+	qp->req.send_wqe_valid = false;
 
 	return 0;
 }
@@ -666,6 +720,7 @@ int rxe_requester(struct rxe_qp *qp)
 		wqe = __req_next_wqe(qp);
 		spin_unlock_irqrestore(&qp->state_lock, flags);
 		if (wqe) {
+			qp->req.send_wqe_valid = false;
 			wqe->status = IB_WC_WR_FLUSH_ERR;
 			goto err;
 		} else {
@@ -681,6 +736,7 @@ int rxe_requester(struct rxe_qp *qp)
 		qp->req.wait_psn = 0;
 		qp->req.need_retry = 0;
 		qp->req.wait_for_rnr_timer = 0;
+		qp->req.send_wqe_valid = false;
 		spin_unlock_irqrestore(&qp->state_lock, flags);
 		goto exit;
 	}
@@ -695,6 +751,7 @@ int rxe_requester(struct rxe_qp *qp)
 	if (unlikely(qp->req.need_retry && !qp->req.wait_for_rnr_timer)) {
 		req_retry(qp);
 		qp->req.need_retry = 0;
+		qp->req.send_wqe_valid = false;
 	}
 
 	wqe = req_next_wqe(qp);
@@ -772,10 +829,12 @@ int rxe_requester(struct rxe_qp *qp)
 			wqe->last_psn = qp->req.psn;
 			qp->req.psn = (qp->req.psn + 1) & BTH_PSN_MASK;
 			qp->req.opcode = IB_OPCODE_UD_SEND_ONLY;
-			qp->req.wqe_index = queue_next_index(qp->sq.queue,
-						       qp->req.wqe_index);
 			wqe->state = wqe_state_done;
 			wqe->status = IB_WC_SUCCESS;
+			rxe_req_writeback_wqe(qp);
+			qp->req.wqe_index = queue_next_index(qp->sq.queue,
+						       qp->req.wqe_index);
+			qp->req.send_wqe_valid = false;
 			goto done;
 		}
 		payload = mtu;
@@ -839,8 +898,10 @@ int rxe_requester(struct rxe_qp *qp)
 	goto out;
 err:
 	/* update wqe_index for each wqe completion */
-	qp->req.wqe_index = queue_next_index(qp->sq.queue, qp->req.wqe_index);
 	wqe->state = wqe_state_error;
+	rxe_req_writeback_wqe(qp);
+	qp->req.wqe_index = queue_next_index(qp->sq.queue, qp->req.wqe_index);
+	qp->req.send_wqe_valid = false;
 	rxe_qp_error(qp);
 exit:
 	ret = -EAGAIN;
diff --git a/drivers/infiniband/sw/rxe/rxe_verbs.h b/drivers/infiniband/sw/rxe/rxe_verbs.h
index 0f5ffd94643f9..a22dfc6e5ae3c 100644
--- a/drivers/infiniband/sw/rxe/rxe_verbs.h
+++ b/drivers/infiniband/sw/rxe/rxe_verbs.h
@@ -114,6 +114,12 @@ struct rxe_req_info {
 	int			wait_for_rnr_timer;
 	int			noack_pkts;
 	int			again;
+	struct rxe_send_wqe	*shared_wqe;
+	bool			send_wqe_valid;
+	struct {
+		struct rxe_send_wqe	wqe;
+		struct ib_sge		sge[RXE_MAX_SGE];
+	} send_wqe;
 };
 
 struct rxe_comp_info {
-- 
2.47.3

