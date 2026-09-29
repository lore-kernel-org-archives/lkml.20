Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1322B30D401
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 03:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790651915; cv=none; b=qB508azK02rwbQN67oAS3y9T8bG4IGHjAccpaWgHSLn2qR1L/mXuc7izoX617YpzAPgUgHeaMpAZM5adVemHLf8rY0ub+tOXA7/LHtB7YGRRzfTDyVfW6LOHWtQQoRCchEo7CX6msY4zg3pNVKmGK64Aya1ZJIT2xzelJF4ooU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790651915; c=relaxed/simple;
	bh=EKDr47KhzqbzBu0y2qj53eTrpjPeQM1e3x2qAroiv40=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dXfLnzYcuQsmyFdx92lMasWJZuVrolycFkjy+HIZiERwYAUuTMHWiIctoOVcnozYrpm49Qb06nPYl8lXHgclZQ+XMdcbLyms0Za9gghiUCeVyY1caHSH4ylKzhXiU8j2o4dX0M1eIV4gudY+tkFUcWyWdeR5xR4RiRyGKKt93k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=qV3Pn5RF; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="qV3Pn5RF"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ec6185so15877845ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 20:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1790651904; x=1791256704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=36VIGgKazBzZZnXWd7vuFJjs2SFoqWZ6NVWhpaNQOGQ=;
        b=qV3Pn5RFEODHEk0PGcdWCtDcBlcYdb5BdqlXzyKSS6zEK5PGHtJ9eZlgFuqE7ccghZ
         etvrrPt+d5on2RoqdkPWISLPZ9BnksOiWm33+Glua3oQmnwmWlfCpP9kWXIwGvJpU/Xz
         +B8XvaIZ5afWJ5pNPRkKSchIsVkLgEJxu5w9Od2LGj5bVZkulDNUHGzrDqzohfY/zihK
         gCCgiB9RU1HOQrdvUX4l7F+YoRtNFXhFXOScngAshYKqlYYEUe1IJU9yIhLqJGCAJCUc
         MMzHXga73y0bAnI2GN2CyaaFY/ORZ8DSn/1h/lcV8pxhBnQvyIk17XLLpzNbUFYovh5D
         VeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790651904; x=1791256704;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=36VIGgKazBzZZnXWd7vuFJjs2SFoqWZ6NVWhpaNQOGQ=;
        b=O3a3beILGsqB7DC87rMzE249LLDpdhSPjnV8dIHiS+ZKhJ+0NKv8lNmjXXCiE6rJV0
         bp3Un0xhuROqhxz2Z0nl9PfsDNeXjyK5k7NeWaT3k6xckZGiKNLgtM0Jdpkefso+FALD
         8GTQF3V6hKBa6dlOPnhAKeEToEHP/yDVeKNC3Fy26h698+ykwOsB8HSJF75/i6rgCpB0
         eKUrzOMnKo+vUW9k1bNbNWcvx1H0oNG5xx+rJG+XjFKsdD+6lA1eJrJ6lX/v4hSbdQ6N
         oDcswqUfYXyWM9YNmWOcy/rJ7Uw5v7Jiwdtw5JVMzy48Ycoy5E8rLmILs8YxFAsGjHiV
         Ee/g==
X-Forwarded-Encrypted: i=1; AKwUvBwJXxE2oi4GhyoZv80cFJpYXRFCYAtwRvdVEe32j2lpvHRyq7HnKzsyyeIKgKVIMXv3/bZWk42dr9+2XV8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjanrrcm0Brcmu2JoyA9wCbeAj7xxRLJttTMwYpO/K/fOVoEcv
	XOZeu9aXDT75TRr4Ba0R9akZne2vaVl2DxVwg5YqA9tyeRk2B1AqmgBd9geU9PgT5OCS53ikk6u
	iD8p66NQ=
X-Gm-Gg: AYBFou2ESF5GsWY+W/WWn4aouLJ+/DwanecK+uzM3qRcrd0ksfzqC2nc28tUHoYJ529
	bwDXySaFdH1bUfwWdkRixmC97s+TTSM4d77kjnfgsZ2C8w6C69So3fEokQd0B45x2j5ob1zzSsJ
	cGA8VkJrfH+9ZnAwLxFQ+yN5hYz8eg9f3TIP3/GzCJ0L8YWmu6DFDsLQsvs6LOpQqBKtkIeBn0i
	iO84anfsqz94tFAyu5L+tpauSmPxrX5jRqiRk8xAu0AK9ZjSJkX8U7C2/2W9fqlKJeewzeF+roe
	1ibRBbhYmUrPR3Vn6Kfh5vcM/isOU9auO+6WvLR9a1B7mFLY54OVwPmx2w9mwN2NI1PqA+PuZlS
	qZrXa13rAhlxeF4iXglbQ12ooFE/c8zpCO0mNRwXtJzQ6ia1z56WzONsbysn9syNY+oA1q0A3q0
	b4v2pO+vxnOmmiVTf3+ZX4wqSJE+X//fZkXjUgqJstBl3GC1xUaKtw6zxmXV0YbvxV6lOLxesCK
	734BA==
X-Received: by 2002:a17:90b:1a91:b0:3a4:880d:4833 with SMTP id 98e67ed59e1d1-3a4880d48a6mr2106447a91.65.1790651904188;
        Mon, 28 Sep 2026 20:18:24 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a492b019besm1648627a91.1.2026.09.28.20.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 20:18:23 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Zhu Yanjun <zyjzyj2000@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>
Cc: linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
	stable@vger.kernel.org
Subject: [PATCH] RDMA/rxe: check the PD when invalidating an MR or MW
Date: Tue, 29 Sep 2026 12:18:11 +0900
Message-ID: <20260929031811.1550334-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rxe_invalidate_mr() and rxe_invalidate_mw() look the object up by index in
the device-wide pool and then only compare the key, so a QP can invalidate
an MR or MW that belongs to a different protection domain on the same rxe
device.  Both entry points are affected: IB_WR_LOCAL_INV from the requester
and SEND_WITH_INVALIDATE from the responder, where the rkey comes off the
wire.

Everything else that resolves one of these objects already refuses a
foreign PD.  lookup_mr() rejects mr_pd(mr) != pd, rxe_reg_fast_mr() rejects
qp->ibqp.pd != mr->ibmr.pd, and rxe_check_bind_mw() was given the same
check in commit fbbe1d5cd7d4 ("RDMA/rxe: Check PDs for memory window
binds").  Remote access is therefore scoped to a PD while remote
invalidation is not.

A peer on one connection can invalidate a kernel ULP's fast-reg MR on
another, which ends that ULP's I/O.  Reject a foreign PD in both
functions; -EINVAL turns into RESPST_ERR_INVALIDATE_RKEY for the
responder and a failed work request for the requester.

The MR side has behaved this way since the driver was merged, where
do_complete() freed the MR it found by index; rxe_invalidate_mw() arrived
later carrying the same omission.

Fixes: 8700e3e7c485 ("Soft RoCE driver")
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
Reproduced on rxe with two protection domains on one device.  PD-A holds the
attacking QP, nvme-rdma holds PD-B and is running I/O.  The RXEINV/RXEPD lines
below are instrumentation I added to observe it and are not part of this patch:
RXEINV prints the two PDs and the MR state inside rxe_invalidate_mr(), and the
attacker takes the target rkey from rxe_reg_fast_mr() rather than guessing it.

Before, a SEND_WITH_INVALIDATE naming nvme-rdma's rkey is accepted:

  RXEPD: hunter: TARGET is a foreign-PD fast-reg MR: rkey=0x29ba mr_pd=00000000185f3e0e (mine: A=00000000d715b639 B=000000001440b63b) iova=0xffff888065174000
  RXEPD: hunter: firing SEND_WITH_INV from QP-A(PD-A=00000000d715b639) at rkey=0x29ba
  rdma_rxe: RXEINV: REMOTE entry rxe_resp.c execute() qp=27 wire_rkey=0x29ba
  rdma_rxe: RXEINV: enter rxe_invalidate_mr qp=27 qp_pd=00000000d715b639 mr_pd=00000000185f3e0e cross_pd=1 key=0x29ba state_before=2
  rdma_rxe: RXEINV: done  rxe_invalidate_mr key=0x29ba state_after=1 (RXE_MR_STATE_FREE=1)
  RXEPD: hunter SEND_WITH_INV -> wc.status=0 (success)

and nvme-rdma's I/O stops:

  nvme nvme0: RECV for CQE 0x00000000448b8c67 failed with status WR flushed (5)
  nvme nvme0: starting error recovery
  nvme nvme0: Reconnecting in 10 seconds...

The controller does not recover, because each reconnect registers a new MR that
is invalidated the same way.

After, the same attack is refused:

  RXEPD: hunter: TARGET is a foreign-PD fast-reg MR: rkey=0x90a0 mr_pd=0000000049ba8cc5 (mine: A=00000000a32c3059 B=000000006c5e8389) iova=0xffff88806bbb0000
  RXEPD: hunter: firing SEND_WITH_INV from QP-A(PD-A=00000000a32c3059) at rkey=0x90a0
  RXEPD: hunter SEND_WITH_INV -> wc.status=5 (WR flushed)

rxe_invalidate_mr() is not reached for a foreign PD, so no cross_pd=1 entry is
traced (4 before, 0 after), nvme-rdma keeps running,

  BCHECK[D] DONE iters=524 clean_p0=524 ioerr=0 CORRUPT_HITS=0 POST_COMPLETION=0

Only the MR path is exercised above.  The rxe_invalidate_mw() hunk is the same
omission in the MW path and is fixed for symmetry; I did not reproduce a
cross-PD MW invalidation.

nvme-rdma's own same-PD invalidations keep working: 3180 of them are traced with the
check in place.

 drivers/infiniband/sw/rxe/rxe_mr.c | 6 ++++++
 drivers/infiniband/sw/rxe/rxe_mw.c | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/drivers/infiniband/sw/rxe/rxe_mr.c b/drivers/infiniband/sw/rxe/rxe_mr.c
index 71d9ea4772890..2da5134560730 100644
--- a/drivers/infiniband/sw/rxe/rxe_mr.c
+++ b/drivers/infiniband/sw/rxe/rxe_mr.c
@@ -743,6 +743,12 @@ int rxe_invalidate_mr(struct rxe_qp *qp, u32 key)
 		goto err_drop_ref;
 	}
 
+	if (unlikely(qp->ibqp.pd != mr->ibmr.pd)) {
+		rxe_dbg_mr(mr, "qp->pd and mr->pd don't match\n");
+		ret = -EINVAL;
+		goto err_drop_ref;
+	}
+
 	if (atomic_read(&mr->num_mw) > 0) {
 		rxe_dbg_mr(mr, "Attempt to invalidate an MR while bound to MWs\n");
 		ret = -EINVAL;
diff --git a/drivers/infiniband/sw/rxe/rxe_mw.c b/drivers/infiniband/sw/rxe/rxe_mw.c
index bddb7a2578313..ab2212eabd71e 100644
--- a/drivers/infiniband/sw/rxe/rxe_mw.c
+++ b/drivers/infiniband/sw/rxe/rxe_mw.c
@@ -276,6 +276,11 @@ int rxe_invalidate_mw(struct rxe_qp *qp, u32 rkey)
 		goto err_drop_ref;
 	}
 
+	if (unlikely(qp->pd != rxe_mw_pd(mw))) {
+		ret = -EINVAL;
+		goto err_drop_ref;
+	}
+
 	spin_lock_bh(&mw->lock);
 
 	ret = rxe_check_invalidate_mw(qp, mw);
-- 
2.43.0

