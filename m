Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1B746AF27
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118507; cv=none; b=GbuNUORBPdCyUZ2zL7LtW8OZWMW0yl8akttGA+jdUHj15Ls8qm4GJIkrmR3/XpkEM5I/853zvHZ130/cqxcvi9JltIAV5ztlMjuVU2gBbA2M3dSHx5NZ5Iki1BD8kDlM/UmP1BABjz4kRcQVT8aGHQP+zn/BF/Jd1nckszVlyfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118507; c=relaxed/simple;
	bh=JxbccAMKRxW2nxjLYbyinkkXQtD69lb/+7dcF46gS1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XIWr1ZZ9NgLI0w0GYUIoD6M56435OKTgnxDaaibocQR/0aaASFk7qKhXmpMh5su+NEAeACrixDcx3qMWasZVXHGbNIKicrq3peY9MfG4H8J2zrWwXiLnqDvlWwcA5KztLnUPk5NKJ0mZwZlVC/SluPppBSEny8gg5UCeQ2+rLiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=fKTYjmxh; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="fKTYjmxh"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39666bed442so120295a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789118505; x=1789723305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1nRQP8B8L3gaI6muFbv8rDx9ncOHiVdLk9CjMYWT4lY=;
        b=fKTYjmxhEfnPFgLIVYl3DHJMA/5km56Eud0IUGpgkf/dc/PWJJFkpKol6G1i9CJnqb
         O1lFv0Skvwr1wZU6KAwFrrpX9KFUvgKrWEhgri3OK6OgTyTEgPD7fZ6hX+IVFP9rz4Lm
         TwQsTyVlcOy77rUWNKSJUTkp9IUUer/IRoC1KrYaDG4w+QNszOx3tYgelOdvHwYnAmXG
         31Oz6A/j1BDimpo81csllimLqQKaywWjtZMJtZ8mn0wD5/0sGaLGlqzLnQc384s93OfU
         k++TeX/h7l2bF7YJuaBx6mWFhr4iWrZHRyauVd7yhzW25CLXR4+Zb6sLuGClh/RfdMTr
         VH/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789118505; x=1789723305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1nRQP8B8L3gaI6muFbv8rDx9ncOHiVdLk9CjMYWT4lY=;
        b=fn56Mt5K4yDcyLABZQMdPbTLpCUdczpIIt0CfAQhkrpHEY1JY3o06PdJOH25UO4FBs
         YFb9f190iHRuUXEBxwtSQ0T5a0GGmq5Knjppd1ZnOyPKV7JrLYRBcT5pkjJhfJUCJS2D
         aHYpSRBOOf8c2bvnwddah3HeArZZNhbcMXSr7Tm6e5t/NOocQ5G0gj7jHY98tk6h/oS+
         J0f4h0P3JHNdl4Bd+y06URNU7Nub7dHVF42bGOOM5OEnYuFk2P02oO4dw3H/cMQwEZ/u
         wPPvwIDxiFAWd4IPzYcAkSz53P1huiPzMDATIOJZ3/qYCJaUjSzJ2wfjBv90bE9o8tHI
         akkw==
X-Forwarded-Encrypted: i=1; AKwUvBy3ojgqY6Vy5mcyo9xBygoYR/HeMMajFFrC5k7UC53US/V+4TvnvRYuLISpxFq9YIPd0+h6cWVFpl0Kek8=@vger.kernel.org
X-Gm-Message-State: AFuF++lc6wEd7YeiPFoZZLdnfuseig+uSv0v5H+F93i6/DT+wYTpZzxM
	ar2lll7DXzis3/r6OtVPO3jWgDU0gc+ez4LO97tsuyzjPcQTfvsasXNejRaSgld0OA==
X-Gm-Gg: AYBFou3N/BTMfYlxqr2tb3eI8vKrgLpjAfInXm3egtg0De+cqRJP9FV5cYU6tnQbVye
	U/8Zj/y6wK0/q8RM5REsPXCwO8m2ZlbEAhFU6khW+VIHk5kHE9o2EG7EvqCI7ai9a28Df8oXjEy
	zrevErnxuTWrJTgathIdSaenMQJhwhb3jeQCyqRZi1jKWPcGZabNqOoD0ZIqO5eXaA2Zs0uu6hD
	9seCFDna+QOniKn1kZEm79khwgNCM1PMlidsOnn7uHUeNOzv4ojefSUFyvQkvUKwZMveQ5iSrWl
	0kwp6QJHdpwpdunZWSYSQ1GnkZ4c4qp4yZHZqd70kPW/ACo/ZMkf17h53lfUthkT9FxPw0RqZiz
	/LsFzmM7hhmvTprXtSdz2nDSYqi3Mlgpx/fCyaLM8xuw0K5zs4VUdZ9swH+idjl1wO4y742CMJb
	8R3LcG5R4x+MvHQ63qtFUkzp8uboJGk+EFnpZCdkJrM38YnVGH4rVRxSNWAdkUZrzmAs0DGok3+
	QDxttwKk3z2vDmrMNRLULQjefOvDZ4n5ff7OH4sFNf4ULAfCWU=
X-Received: by 2002:a17:90b:3904:b0:396:d27c:8696 with SMTP id 98e67ed59e1d1-39d9c392a75mr3667346a91.4.1789118504456;
        Fri, 11 Sep 2026 02:21:44 -0700 (PDT)
Received: from en4217367l.tail5febd7.ts.net (209-147-138-20.nat.asu.edu. [209.147.138.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm6065003eec.23.2026.09.11.02.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 02:21:43 -0700 (PDT)
From: Rahul Priolkar <rahul.priolkar@asu.edu>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: Christian Schoenebeck <linux_oss@crudebyte.com>,
	v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [BUG] 9p: fd: p9_conn_cancel publishes status before t_err
Date: Fri, 11 Sep 2026 02:21:32 -0700
Message-ID: <20260911092132.3328659-1-rahul.priolkar@asu.edu>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

I'm Rahul, a PhD student at Arizona State University working on a kernel
data-race detector that records conflicting, byte-overlapping memory accesses
from concurrently executing synchronization-free regions.

While evaluating Linux v7.3-rc2 with our experimental detector, I found a data race 
in the 9p fd transport where p9_conn_cancel() publishes REQ_STATUS_ERROR
before storing the associated transport error in req->t_err.

A waiter in p9_client_rpc() can observe REQ_STATUS_ERROR, leave its wait,
and read the initial zero value from req->t_err. It can then skip the
transport-error path and attempt to parse req->rc even though no valid
response was received.

Tested configuration
--------------------

Upstream kernel: Linux v7.3-rc2 (df2908090cda368b01ff43709f51890076c56157)
Compiler:       Ubuntu clang version 17.0.6 (9ubuntu1)
Architecture:   x86-64 QEMU/KVM

Conflicting accesses
--------------------

The conflicting read is in p9_client_rpc() at net/9p/client.c:612:

    if (READ_ONCE(req->status) == REQ_STATUS_ERROR) {
            ...
            err = req->t_err;          /* racing read */
    }

The conflicting write is in p9_conn_cancel() at net/9p/trans_fd.c:182.
In the same function, req->status is published at line 169 or 173 before
the lock is released at line 176 (abridged):

    spin_lock(&m->req_lock);
    ...
    WRITE_ONCE(req->status, REQ_STATUS_ERROR);
    ...
    spin_unlock(&m->req_lock);

    ...
    if (!req->t_err)
            req->t_err = err;          /* racing write */

req->t_err is intended to be published through the barrier and status
transition in p9_client_cb(). However, p9_conn_cancel() stores
REQ_STATUS_ERROR before writing t_err. The waiter can therefore observe
the earlier status store and read t_err before it is written. Its
smp_rmb() cannot make a future write visible, and the later callback
cannot repair a value the waiter has already read.

Observed access stacks
----------------------
The caller frames retain the report's symbolized return-PC locations; these
locations need not be the callee's call statement.

    A: read, size=4, offset=4
      #0  p9_client_rpc         net/9p/client.c:612
      #1  p9_client_version     net/9p/client.c
      #2  p9_client_create      net/9p/client.c:915
      #3  v9fs_session_init     fs/9p/v9fs.c:471
      #4  v9fs_get_tree         fs/9p/vfs_super.c:97
      #5  vfs_get_tree          fs/super.c:1947
      #6  fc_mount              fs/namespace.c:1198
      #7  do_new_mount_fc       fs/namespace.c:3772
       held locks: none

    B: write, size=4, offset=4
      #0  p9_conn_cancel        net/9p/trans_fd.c:182
      #1  p9_poll_mux           net/9p/trans_fd.c:600
      #2  p9_poll_workfn        net/9p/trans_fd.c:1064
      #3  process_one_work      kernel/workqueue.c:3401
      #4  process_scheduled_works kernel/workqueue.c:3473
      #5  kthread               kernel/kthread.c:438
      #6  ret_from_fork         arch/x86/kernel/process.c:164
      #7  ret_from_fork_asm     arch/x86/entry/entry_64.S:258
       held locks: none

Targeted Syzkaller workload
---------------------------

The following exact Syzlang workload creates pipe pairs with pipe2$9p and
starts mount$9p_fd asynchronously. The mount waits in p9_client_rpc() for
version negotiation while concurrent response writes and closes exercise
the fd transport poll worker and p9_conn_cancel():

    pipe2$9p(&(0x7f0000000000)={<r0=>0xffffffffffffffff, <r1=>0xffffffffffffffff}, 0x0)
    mount$9p_fd(0x0, &(0x7f0000000100)='./file0\x00', 0x0, 0x0, &(0x7f0000000200)={'trans=fd,', {'rfdno', 0x3d, r0}, 0x2c, {'wfdno', 0x3d, r1}, 0x2c, {[], [{@version_L={'version=9p2000.L'}}]}}) (async, rerun: 64)
    write$9p(r1, &(0x7f0000000300)="650000000000000000000000000000000000000000000000", 0x18) (async, rerun: 64)
    write$P9_RVERSION(r1, &(0x7f0000000400)={0x15, 0x65, 0xffff, 0x2000, 0x8, '9P2000.L'}, 0x15) (async, rerun: 64)
    close(r0) (rerun: 64)
    close(r1) (rerun: 64)

    pipe2$9p(&(0x7f0000000500)={<r2=>0xffffffffffffffff, <r3=>0xffffffffffffffff}, 0x80000)
    mount$9p_fd(0x0, &(0x7f0000000600)='./file1\x00', 0x0, 0x20, &(0x7f0000000700)={'trans=fd,', {'rfdno', 0x3d, r2}, 0x2c, {'wfdno', 0x3d, r3}, 0x2c, {[], [{@version_L={'version=9p2000.L'}}]}}) (async, rerun: 64)
    write$9p(r3, &(0x7f0000000800)="0100000065", 0x5) (async, rerun: 64)
    write$9p(r3, &(0x7f0000000900)="ffffffffffffffffffffffffffffffff", 0x10) (async, rerun: 64)
    close(r2) (rerun: 64)
    close(r3) (rerun: 64)

    pipe2$9p(&(0x7f0000000a00)={<r4=>0xffffffffffffffff, <r5=>0xffffffffffffffff}, 0x0)
    r6 = dup(r5)
    mount$9p_fd(0x0, &(0x7f0000000b00)='./file2\x00', 0x0, 0x20, &(0x7f0000000c00)={'trans=fd,', {'rfdno', 0x3d, r4}, 0x2c, {'wfdno', 0x3d, r6}, 0x2c, {[], [{@version_L={'version=9p2000.L'}}]}}) (async, rerun: 64)
    write$P9_RVERSION(r6, &(0x7f0000000d00)={0x15, 0x65, 0xffff, 0x2000, 0x8, '9P2000.L'}, 0x15) (async, rerun: 32)
    write$9p(r6, &(0x7f0000000e00)="650000000000000000000000", 0xc) (async, rerun: 64)
    close(r5) (rerun: 64)
    close(r6) (rerun: 64)
    close(r4) (rerun: 64)

The syz-manager enabled only the following syscalls:

    getuid
    geteuid
    getgid
    getegid
    pipe2$9p
    mount$9p_fd
    write$9p
    write$P9_RVERSION
    dup
    close

This workload produced the representative report above with our detector.
It is not a minimized, deterministic one-shot reproducer. Our detector is
not currently public, so the seed alone does not reproduce the diagnostic;
I have also not observed this race under KCSAN.

Feasible interleaving
---------------------

+-------------------------------------+-------------------------------------+
| T1: p9_client_rpc()                 | T2: p9_poll_workfn()                |
|     p9_fd_request()                 |     p9_conn_cancel()                |
+-------------------------------------+-------------------------------------+
| Allocate req (client.c:521):        |                                     |
|   p9_tag_alloc (client.c:181-183)   |                                     |
|   rc.size=0; t_err=0; status=ALLOC  |                                     |
| Return req; call request()          |                                     |
|   (client.c:533,583)                |                                     |
+-------------------------------------+-------------------------------------+
| p9_fd_request(), under m->req_lock: |                                     |
|   status = UNSENT      (line 648)   |                                     |
|   add to unsent list   (line 649)   |                                     |
|   unlock               (line 650)   |                                     |
+-------------------------------------+-------------------------------------+
|                                     | Poll error -> p9_conn_cancel()      |
|                                     |   (trans_fd.c:594-597)              |
|                                     | Under m->req_lock:                  |
|                                     |   set m->err            (line 164)  |
|                                     |   move to cancel_list   (line 172)  |
|                                     |   status = ERROR        (line 173)  |
|                                     |   unlock                (line 176)  |
+-------------------------------------+-------------------------------------+
|                                     | if (!req->t_err) sees 0             |
|                                     |   (trans_fd.c:181)                  |
|                                     | <T1 runs before the t_err write>    |
+-------------------------------------+-------------------------------------+
| p9_poll_mux() sees m->err < 0       |                                     |
|   (trans_fd.c:591-592)              |                                     |
| request() returns 0                 |                                     |
|   (trans_fd.c:652-654)              |                                     |
| Wait condition is already true:     |                                     |
|   ERROR(5) >= RCVD(3); no sleep     |                                     |
|   (client.c:593-594;                |                                     |
|    include/net/9p/client.h:65-71)   |                                     |
+-------------------------------------+-------------------------------------+
| *** DATA-RACY READ: t_err ***       |                                     |
| err = req->t_err; /* initial 0 */   |                                     |
|   (client.c:612)                    |                                     |
+-------------------------------------+-------------------------------------+
| err == 0 skips transport error      |                                     |
|   (client.c:632-633)                |                                     |
| p9_check_errors() parses empty rc   |                                     |
|   (client.c:405,635)                |                                     |
| first u32 read returns -EFAULT      |                                     |
|   (client.c:359; protocol.c:        |                                     |
|    211-217,284-290)                 |                                     |
| RPC returns ERR_PTR(-EFAULT)        |                                     |
|   (client.c:639-641)                |                                     |
+-------------------------------------+-------------------------------------+
|                                     | *** DATA-RACY WRITE: t_err ***      |
|                                     | req->t_err = err                    |
|                                     |   (trans_fd.c:182)                  |
|                                     | p9_client_cb() (trans_fd.c:183)     |
|                                     |   smp_wmb; publish ERROR; wake      |
|                                     |   (client.c:329-332)                |
+-------------------------------------+-------------------------------------+

T1 observed the earlier status store, which precedes the t_err store.
The barrier and wakeup in the later callback therefore cannot change the
zero already copied into T1's local err variable or undo the parser
path.

The detector establishes the conflicting accesses and overlapping
synchronization-free regions, but it does not record the accessed values or
prove that this exact instruction-level schedule occurred. The interleaving
above is derived from the observed accesses and source-level publication order.

Impact
------

This ordering permits the waiter to consume the initial zero t_err and
enter response parsing. The likely consequence is incorrect transport
error propagation, such as returning a response-parser error instead of
the transport errno during version negotiation or mount/session setup.

I have not yet isolated a distinct user-visible failure caused by the bad
value, and I have not observed evidence of a use-after-free, memory
corruption, or privilege escalation in these reports.

Possible fix
------------

A fix needs to publish req->t_err before any waiter-visible
REQ_STATUS_ERROR transition, while retaining the under-lock status update
that prevents competing cleanup paths from manipulating req_list. This
likely requires moving the t_err assignment before the early status store
and preserving an explicit data-before-status ordering guarantee.

Could you confirm whether this ordering constitutes a real data race in
the 9p fd transport, or whether I have missed a synchronization guarantee
that makes these accesses safe?

If useful, I can also work on a standalone userspace stress reproducer and
test potential fixes.

Best,
Rahul
