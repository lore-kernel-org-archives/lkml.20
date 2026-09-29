Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97143F8220
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 05:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790660631; cv=none; b=kOGul80RCv+wdA/I0QvW/Tfqe6Gcl9V++T8QP7LswzobOhFA8z28pPNTYHb4pO1NPcxb/a3pcJG5y5MFp+iwTYHeoqrAuFvb8D2ui6geZHrt75caVYBfHPw08ozJf0qYyVRbNjQDK+YjqxJP8QFum3f6oBT3k7/EFnZvc4NaSb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790660631; c=relaxed/simple;
	bh=sQv+3EQ/YpC4KBY6er3ezC/52sPg6K8xe3lTdLTN1/Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NGuDLryN3EVNDZK1xbj/YceUPvt2G4D1qpPP4JlcSvfyyBAJDrYy0Idet/xmrWklMihTOPzJ0nT2He+humOrI6AdVJIqGgyAAmXx8bcLCLwHU7uPfGMTjfQjvkvUoLCxr1fXKJnJujn7jwQ3XKHVIEyjGnWLbLMIwKsHXcO7Zt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=w39jUsCJ; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="w39jUsCJ"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc79223bcfbso1982797a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 22:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1790660628; x=1791265428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ms7L8HqUGt31K1Ab3M9o1OoA83EPLyzTDgllkVMwSho=;
        b=w39jUsCJtIkQsLIXVnuptYwv/KryvVQN4yLyVbiRJkfXGg4klGFS/NvQEwSwyobwRp
         vdU2xbLC6KWjIOGKEAol8KZE/ZdxwOoXltEXaj2CUeyh2MqmJ6+NN+77mkDQlBzLs6kB
         Z81EsbDboH4rwdfkU5zYR9kL/uIiOJfM9OyKL8Lxdve6+vk2Cw6Ko4JtVpux7sGLl9A9
         tsAdhhDVyo332DiEvJuMWXXUAmWjw7sBGZ4e/5o/yoQnIZAamIoXmkOSQdQzBMWto/CJ
         C66jTZAmgGsFW8FMz4RsNqDBpNQwtYbaCGA0SkmGMDKEpl+Q+bA3xuVZBcBwB2legBIv
         TBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790660628; x=1791265428;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ms7L8HqUGt31K1Ab3M9o1OoA83EPLyzTDgllkVMwSho=;
        b=OXzjwa1jMRmxu4Rz1PvmWeZMtCTcmli1WzabBpoCaq/w6XT7eaa1qPil0598ZKdi7v
         Y7d9+i/q8HI2h3ooxEbyNZDgjKFUswgiGraA4w0jSso4TtUtbCo4mlH5RVUdGo0SRMBO
         5U209zWZCIWzR8C4aUh29ut8ot0Sy9ocQxRc9x37oTSUZJh2aInrxsN4bZIeRYKIAChM
         zI/oYf6E0/hY0fbnwN1G7wTf6YBKMPcvXSFN4QaU1o9Dg7apCG2U0UHzzeuxGewypvlj
         h6oUslKQPc/effA4ImFlcrKFDAKp1RXL9LwEDwFfc5oXH/aJds2CbLXDNrVwsRv5OJ5Q
         Q8CA==
X-Forwarded-Encrypted: i=1; AKwUvBzgkDumAZiL1JOx9Gjrz2sTXTsmbw/b5RG+8Z8lYB2Cahn5sIXjGbuVjDIb5H0YiinVZS2DmFzVZ6ZFir8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLXBCG6BwydpewGoxBOxhYq7wrPDMcovlt8DTiJLXjZNxKi8LF
	qnRaE3BMX3pOkSCk8bpsaGkfQO7hBCFxc2+dxQGLzuwOyGPGO8lIYLPh45qjIIBmCH0=
X-Gm-Gg: AYBFou0ylfcT1OnbehmLrsRJnsvX4bQc0MjxwF9MD4XQ3Mj8ETKNajWO5r5RJ5125RI
	SYcAetILdMRcYcNwGHgn9AJvhRBf0Vb3GOFiztWBe34lpolX3ShzMe7RJSewOfVUq7lnf0QCwBX
	6H31HxSPd6FY8HVTbQktDjQGLntWj8I7XaAPR3yD1w+r/2j61A33PhExfo57J9/cfTH4v9QRkVT
	mFJnwYfIRWDM278JlJhKVzGNNkLtZ1V0MiFluYNabv5OB0aE+arSGagperPpOP8ncvIvr7DltY8
	xXzi5w7PsuHRgzJjrb1cGPk61mq4oh9DX06NFrm5KlU8TUy+lvRitSwdLbSdFIdOTNoA5SDIxqU
	Z3NbGC6zv9WaWxcxL/Fm9T0y+EEHCcKkNyEKhlrlFAg245/EcLdA4yKLSATXReoGdXWzdaHvyqI
	tbCfKA+22QxuPJH7MCtbyziU4GeUF5LzCdbVAxh53GoP7rchSvHiu2BAutHWzr5H0p4ZC/1XW7s
	WO8Hw==
X-Received: by 2002:a17:90b:1c92:b0:39e:6c68:c77d with SMTP id 98e67ed59e1d1-3a098e0515cmr13918632a91.51.1790660627617;
        Mon, 28 Sep 2026 22:43:47 -0700 (PDT)
Received: from yhlee-960QFG.. ([125.131.91.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a49818b39bsm3233581a91.15.2026.09.28.22.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 22:43:47 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: haris.iqbal@ionos.com,
	jinpu.wang@ionos.com
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Farhad Alemi <farhad.alemi@berkeley.edu>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>,
	stable@vger.kernel.org
Subject: [PATCH] RDMA/rtrs-clt: Reject a zero queue_depth in the connection response
Date: Tue, 29 Sep 2026 14:42:22 +0900
Message-ID: <20260929054222.1576877-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtrs_rdma_conn_established() stores the queue_depth the server advertises
in its cid 0 connection response without checking that it is usable.  The
only bound it ever had was an upper one, dropped in commit 0e8558476faf
("RDMA/rtrs: Avoid Wtautological-constant-out-of-range-compare") because
it cannot fail for a u16; a lower bound was never there.  A server that
reports zero therefore leaves clt_path->queue_depth at 0, and setting up
the first I/O connection trips

	if (WARN_ON(!clt_path->queue_depth))

in create_con_cq_qp().  The connect is aborted, but the peer has already
tainted the kernel, and on a kernel built with panic_on_warn it panics
outright -- all from one field in the response to a connect.

The rbufs array is sized from the same value one statement earlier, so it
is also allocated with zero elements, which kzalloc_objs() returns as
ZERO_SIZE_PTR.  Nothing dereferences it: the WARN aborts the connect
before any buffer is registered and the path is then freed, and a path
that already carries a nonzero depth is caught on reconnect by the
existing "queue depth changed" test.  The WARN is the whole of the damage.

The in-tree server never sends zero -- check_module_params() rejects
sess_queue_depth < 1 -- so this needs a hostile or broken server, but the
client should not rely on the peer for that.  Reject it before rbufs is
sized from it and before it is stored, but after the existing "queue depth
changed" test, so that a server which drops a nonzero depth to zero across
a reconnect still takes that path and still disables auto-reconnect.

Reproduced with rnbd-client over soft-RoCE against an rtrs-server patched
to advertise queue_depth = 0:

  WARNING: drivers/infiniband/ulp/rtrs/rtrs-clt.c:1688 at
    rtrs_clt_rdma_cm_handler+0x1b27/0x29f0, CPU#0: kworker/u8:5/56
  Modules linked in:
  CPU: 0 UID: 0 PID: 56 Comm: kworker/u8:5 Not tainted
    7.3.0-rc5-nvmerdma-atk-g72d3fcf802c4-dirty #23 PREEMPT(lazy)
  Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix,
    1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
  Workqueue: ib_addr process_one_req
  RIP: 0010:rtrs_clt_rdma_cm_handler+0x1b27/0x29f0
  Call Trace:
   <TASK>
   ? arch_stack_walk+0x94/0xf0
   ? __pfx_rtrs_clt_rdma_cm_handler+0x10/0x10
   ? ret_from_fork_asm+0x1a/0x30
   ? process_one_work+0x6b4/0x10e0
   ? stack_trace_save+0x8e/0xc0
   ? __pfx_stack_trace_save+0x10/0x10
   ? __kasan_slab_free+0x43/0x70
   ? stack_depot_save_flags+0x29/0x7e0
   ? worker_thread+0x45b/0xd10
   ? kthread+0x2c8/0x3b0
   ? ret_from_fork+0x36e/0x5a0
   ? _raw_spin_lock_irqsave+0x86/0xe0
   cma_cm_event_handler+0x3e/0x240
   addr_handler+0x1e0/0x300
   ? __pfx_addr_handler+0x10/0x10
   ? pick_task_fair+0x46f/0x1a60
   process_one_req+0x10d/0x510
   ? finish_task_switch.isra.0+0x1d9/0xa70
   ? __pfx_process_one_req+0x10/0x10
   process_one_work+0x6b4/0x10e0
   ? __pfx___schedule+0x10/0x10
   ? __pfx_process_one_work+0x10/0x10
   ? _raw_spin_lock_irq+0x81/0xe0
   ? __pfx_process_one_req+0x10/0x10
   ? assign_work+0x11d/0x370
   worker_thread+0x45b/0xd10
   ? __pfx_worker_thread+0x10/0x10
   ? __pfx_worker_thread+0x10/0x10
   kthread+0x2c8/0x3b0
   ? recalc_sigpending+0x15c/0x1e0
   ? __pfx_kthread+0x10/0x10
   ret_from_fork+0x36e/0x5a0
   ? __pfx_ret_from_fork+0x10/0x10
   ? __switch_to+0x572/0xdd0
   ? __pfx_kthread+0x10/0x10
   ret_from_fork_asm+0x1a/0x30
   </TASK>
  ---[ end trace 0000000000000000 ]---

  rtrs_client L2644: <s1>: init_conns() failed: err=-EINVAL
    path=<invalid address family>@ip:10.0.0.1 [rxe0:1]

With the check in place the same server is refused without a splat, and an
honest server is unaffected:

  rtrs_client L1870: <s1>: Invalid RTRS message: queue_depth is 0
  rtrs_client L2649: <s1>: init_conns() failed: err=-ECONNRESET
    path=<invalid address family>@ip:10.0.0.1 [:0]

Fixes: 6a98d71daea1 ("RDMA/rtrs: client: main functionality")
Reported-by: Farhad Alemi <farhad.alemi@berkeley.edu>
Closes: https://lore.kernel.org/linux-rdma/CA+0ovCg_sG8gaZXXj9zmOrpxRt=8+-x9wvycVNUKwWmMbr6-Yg@mail.gmail.com/
Cc: stable@vger.kernel.org
Signed-off-by: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
---
 drivers/infiniband/ulp/rtrs/rtrs-clt.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/infiniband/ulp/rtrs/rtrs-clt.c b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
index eac38b57b00d7..5c2c65c15a65a 100644
--- a/drivers/infiniband/ulp/rtrs/rtrs-clt.c
+++ b/drivers/infiniband/ulp/rtrs/rtrs-clt.c
@@ -1866,6 +1866,11 @@ static int rtrs_rdma_conn_established(struct rtrs_clt_con *con,
 			return -ECONNRESET;
 		}
 
+		if (!queue_depth) {
+			rtrs_err(clt, "Invalid RTRS message: queue_depth is 0\n");
+			return -ECONNRESET;
+		}
+
 		if (!clt_path->rbufs) {
 			clt_path->rbufs = kzalloc_objs(*clt_path->rbufs,
 						       queue_depth);
-- 
2.43.0

