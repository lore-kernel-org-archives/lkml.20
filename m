Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793385254;
	b=5Wx17iFE+c0guSNVyM8Dd8nILKpya+Y5qCBjl4MW7gI8ZsY50cMzwhJc7dCVQu6XZwxw
	 SY2uRXEjDTyQ0j33lObdEGVWGzmMq4UPOJPS8ZIkDUFmtHojKk4m9D6NtDPFUdJnzUtFx
	 pl/fRWY/SdcVX/KkrYaWKXqVs8hnK4UtLXBXIeVeqOysd99rBGGPDppv5z9E4pUjUQ1x/
	 JCadLn2eD9pygks85vmnXG3GUkRrajlUukG/Ig5BAPXb2yCuOILDodh55dD7g0KogdbSt
	 F3hzEt/twmtbzcOi3eKamWk5+WjoKjxjOVznj/0TTLiw5qK46FsXIDl5Q/SuG9dOeqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=Aur5CvG/rrs86OAInMddXi3+JvGSE98Vw4EUj9Sc8zo=;
	b=nSsyjkRJsYHz/ssibXIAUEpCNR+k01KNVA2eCfaSAtC5HCQwIlr3pO8Xe9ZXfTRiCYO7
	 GmibwCm6Zwiin0tagACR/hdXfe5Os0nOqyjKT1UeY6oVfocab60vIOOpKUeVpVfVQndKT
	 zO4okXwBIR1sQeWlAqefoWmd+Q3RwlorFVXiyogC32ez0IoLOcZf0UynPgdWsZgfLi54L
	 4h1r9Q4zIzEBQRi5zwVX5bc9v31mma6+HPoCODghuBOZh+jMMeEFoy64q1Tf3nXHNX2a1
	 pA37eE47NZuXD86A9OZbVTVk4Ucyz4bUSBVS2AN311QUVpriDcNbmpah7ZNPT6/pACw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wql+O7Fd;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A59B0606A327
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:34:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A59B0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wql+O7Fd
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so8948305e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793385252; x=1793990052; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aur5CvG/rrs86OAInMddXi3+JvGSE98Vw4EUj9Sc8zo=;
        b=Wql+O7Fd33raBYJVBcOmWlXMCiBVxIbImiYQWW5+PTLI9DRhj4KNXjfq9fysUX0pMc
         3mTxshn63HDK719pYVMFygsipkUNODiEd9m3G2i8Q0ZByc0eEOFaMr7ws76nGaMLuuQn
         dqH/iGLpIqs7yaEsvwAUM3NM+nVJAVRbIGgzFDyfk1A6uUM+RZjyENqHsBakzUKKX7Xg
         ILQNqv/hVDPI5OrMeYYtAzj74gd52GjxdBp5tzsCSKz6jODFG0SgIglyV2lSnWzBSNM5
         BpRUjIFV+Rz/o1K/gCdH+R27gUUGQHJTjN4kLGF1qA432P6WPJzW+HRIHRT3qHvmB4fv
         xCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793385252; x=1793990052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aur5CvG/rrs86OAInMddXi3+JvGSE98Vw4EUj9Sc8zo=;
        b=mxVsDhMKwyiNToC0mjwBKiBb/kHvzCrUWUhv6PjmIBmFuKo3npszq25SXNj6O7fO7Y
         /DQtktdvljR3XsklyFXpv8k3qvjWwxL0TkKTkYy/gHNylUIEKAd0bVD7mucI0/iBdEtD
         EJFU+gRxpyukkr/eOg68Y/vT5NRhuTcdIpR5MOLS6UsoANoV1XK6vpK65Yg6ii893Gq/
         XNbyRcdbP2BfkQRq9WxAVjlzhkcKFJspnq4+F3dIhbFVxlWM551rsDNjun6wiOe2K1hc
         6k7WOi5XeYY1vJArm1v2fCJFbp4l8ERX9VUV5w6NuP4Ntl31iab5x0zySbeNQNRkSSx+
         PZoA==
X-Forwarded-Encrypted: i=1; AKwUvBwdF0vojNA5QiA4sHYJqy4yXdY9z4rUbxELGyiW3cgtnMIYSyNL4nu70WCEEVbcZ/d/esnVolUXyWmtfws=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLCSwlCCFhsmKt9sHL600KJBPP0tEVH3KD2EDEpakc9XiTFVCD
	kpbGjaD5Mb9oRtl4IEdpTjceOJgS5FwXN676rNtV9kEwvYyQiiXoSYY=
X-Gm-Gg: AYBFou39jn46OIKblBUMh/0Xs6TvQ8fBGs6RUM3PPheUsx5Ha1nvIbADYDx5FeEWpUP
	DLRSuM6nWGe8L84LBtyo1yaGHuCFZ4xPYf0wa7eikzciNmw6hObjBl+Vzcmb3cA5x+7kmc7eG3X
	oA/JX0JlEuuS7dYNmEjnDg4AjvB7s1XbHKIbhREBxDXZ203B0yoyEhOObivEuab1fi2RUhlGa8y
	UkVYZqPsHT8ZCicePn33KcrJHCFXsgTAsXUduRuqfHxvjMigfGgPhAaiymJC7QhdmwT/nIWcZvZ
	u2t/X+1hBUFvRYU7h3B0vfRHrGb1oFsr+l9iTnTZxNbT8Nx0YBw87L2cw6WRPkRn44psllmPfIf
	Gm9pXBTNee0yC+VTBKsLvM2Yen62oO95eHT78SZ+sKnqnFz5SMjuMt/i/cXM7sdzOE82+VAjuMS
	W1v8dMCv6wtfKBzhaVmn48+Hnuw0XdceCeurS0XSckWt0wwz7T4l4sl6ilTRa/rPPHQz5cEHIK2
	TtgMAZSaLNR/xoYrk3xDER0jtpUw15WYvxHXX5NQgU+p01Ru0RZ0TQqhgg1tD7lbgAy0sxEkwJU
	yMo1BBdvFxw=
X-Received: by 2002:a05:600c:6214:b0:4a2:9cda:57cb with SMTP id 5b1f17b1804b1-4ac151a9077mr78689535e9.1.1793385251866;
        Fri, 30 Oct 2026 11:34:11 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ab61d8b9f4sm114204175e9.12.2026.10.30.11.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:34:11 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
X-Google-Original-From: Tristan Madani <tristan@talencesecurity.com>
To: Zhu Yanjun <zyjzyj2000@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH v9 1/2] RDMA/rxe: copy send WQE to kernel buffer before processing
Date: Fri, 30 Oct 2026 18:34:08 +0000
Message-ID: <20261030183409.195671-2-tristan@talencesecurity.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261030183409.195671-1-tristan@talencesecurity.com>
References: <20261030183409.195671-1-tristan@talencesecurity.com>
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

After copying, reject out-of-range opcodes by setting mask to 0 so that
next_opcode() transitions the QP to error state. Clamp atomic write
residual to sizeof(u64) to prevent finish_packet() from reading past
the WQE buffer. The WR-level mask (WR_ATOMIC_WRITE_MASK) is checked
since wr_opcode_mask() populates wqe->mask from enum rxe_wr_mask.

The local copy is reused across multi-packet sends to preserve DMA
progress state (cur_sge, sge_offset, resid). Field updates including
DMA progress are written back to the shared queue using WRITE_ONCE()
for individual fields and smp_store_release() for state transitions,
so the completer and userspace observe consistent values without the
tearing risk of bulk memcpy(). DMA progress writeback ensures retries
can resume from the correct offset.

The copy is invalidated when the WQE index advances (last packet sent,
error, local ops, UD oversized), when a retry resets WQE state, on QP
reset, or when the QP enters error state for flush. Retry invalidation
also clears the completer WQE cache so the completer re-reads from the
shared queue after the requester retransmits with updated PSN bounds.

Fixes: 8700e3e7c485 ("Soft RoCE driver")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---

Changes since v8:
  - Fix atomic write resid check: use WR_ATOMIC_WRITE_MASK (WR-level
    mask) instead of RXE_ATOMIC_WRITE_MASK (packet-level mask) so the
    condition actually fires for IB_WR_ATOMIC_WRITE WQEs (sashiko
    finding).
  - Fix atomic write rejection: clamp dma.resid to sizeof(u64) instead
    of setting mask to 0, since next_opcode() ignores wqe->mask and
    uses wqe->wr.opcode directly (sashiko finding).
  - Invalidate completer WQE cache on retry so the completer re-reads
    from the shared queue after the requester retransmits with updated
    PSN bounds (sashiko finding).

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

 drivers/infiniband/sw/rxe/rxe_qp.c    |  1 +
 drivers/infiniband/sw/rxe/rxe_req.c   | 72 +++++++++++++++++++++++++--
 drivers/infiniband/sw/rxe/rxe_verbs.h |  6 +++
 3 files changed, 74 insertions(+), 5 deletions(-)

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
index 24f5c044363f7..f2524b179daec 100644
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
+	 * Clamp oversized resid to prevent OOB read in finish_packet().
+	 */
+	if (unlikely((wqe->mask & WR_ATOMIC_WRITE_MASK) &&
+		     wqe->dma.resid > sizeof(u64)))
+		wqe->dma.resid = sizeof(u64);
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
@@ -695,6 +751,8 @@ int rxe_requester(struct rxe_qp *qp)
 	if (unlikely(qp->req.need_retry && !qp->req.wait_for_rnr_timer)) {
 		req_retry(qp);
 		qp->req.need_retry = 0;
+		qp->req.send_wqe_valid = false;
+		qp->comp.comp_wqe_valid = false;
 	}
 
 	wqe = req_next_wqe(qp);
@@ -772,10 +830,12 @@ int rxe_requester(struct rxe_qp *qp)
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
@@ -839,8 +899,10 @@ int rxe_requester(struct rxe_qp *qp)
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

