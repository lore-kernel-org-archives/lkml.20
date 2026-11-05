Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793848034;
	b=FwwrARAqCjcHmbfoyX2FxFz0SIYBHVZ7+6xw2ZO9H0C3PIK6xEEb4+8U08ClfUyHkiTo
	 17D474Ny5X/RHmwi9CHT2Wb3Bcy00oK6cRcsFgYWfkWGqBpPTYRoTO+FaJo8A6DV/c2P0
	 dHHLAXjoR29+HJnM9G41d4rgkHPsfo92dcLlm+9r1a7AN3WtDYvujxfK8dBp7rqeAaWaf
	 HDvhKo3LAQ9Ap8sF6YYCecfr0jeVr0awStBDzQBl2P9tZadMAUOPRONxLIlHuSVyJIXkf
	 Al4AlmIGJWcHa1fD31gfELJDJ8ek/HzXP9Q5uILLct1oIvy0MbZ+/HJ/9gs0YpykWWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793848034;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=5gHM2b/r5UdddtGztOAveat2VzMHH0Xvqre8s1JTorQ=;
	b=kEEY5inbbt3hGaACrMpdDrzjnnkvCBAhzzvyi08JtToLQBbRB10vRSUAQjlwbl+IJKp7
	 cuOX4v+G5EJTxDu3lk/Iw6SYRDiAj5i5xWretW+PMMSr7GZmE3exFqewICCBIfH5mFvjZ
	 mt/yLyh5mFAD3c4+BUulN10uJ7C8kD0WJ/v1sdbC4QiSULhZe8as7H9g9F38LMH7iRTKp
	 tummY7zYnXsuqoECb8VhKRBKxI+nru/cXlJhktYpssvmWpArqTh1pHpd1eO2QmCqbbpzb
	 88EYA3SE2RrxjFwiCu0r6B82QTQoqn2CFH5LorQFRvbxAkpnQFdwe/dmNdfa/6ePoBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=everpuredata.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=TXeOGWTx;
	arc=none smtp.remote-ip=209.85.128.101
Received: from mail-wm1-f101.google.com (mail-wm1-f101.google.com [209.85.128.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDEB606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 03:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BDEB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=TXeOGWTx
Received: by mail-wm1-f101.google.com with SMTP id 5b1f17b1804b1-4a208d93758so15283925e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 19:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1793848031; x=1794452831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5gHM2b/r5UdddtGztOAveat2VzMHH0Xvqre8s1JTorQ=;
        b=TXeOGWTxyKrUAG5UlVaLWM8MTJ5y878zTZp2B4GhP6fv/ziq9FI5Vgu4kCEk03e/WY
         B5OPaX3fTw4BYizuycDAZyBqE6lEDA+ij60PYy5wuZG3c9AbJ+crNPr2bxemacY/Aww+
         Mxj5+vOHmkc1x2vhyAEOm8xd4MlZSBfZCS2BX1Lvb5DsydmXCTBWy642XOlijXrYhpn3
         G6iWGrU+SDZ8B4VcQXZkPenyFcc0zvIVok+4W/tto7HTMX4z39ABA6vpMdxh/MlETtSq
         4MFlb8b6FW3+szipeM0krIx9dfh5Gry/MUSxNn8F82kZFt6LBqFS7QKCPfTlvvHpaKBQ
         ZIAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793848031; x=1794452831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5gHM2b/r5UdddtGztOAveat2VzMHH0Xvqre8s1JTorQ=;
        b=OTM2E/eMBxu2XuX+eg9pFKijJA7pGAOCY+/FB/N8TeVNQ0zGdypC/yW0IJVy0niEvr
         M2Flz+tYPtHatCeIL9p2yA4vUdd76IZjCJ8Xj9n0kBAhMl1DsF7jNObDFlFaJTLcFVY7
         Y1MdlK21TXBrz4V1xJM9Ob6s/zlsuHWQvbexDgsZZ4EHxTTKliniYc9Qko2Zhdw5H8Id
         A9hSpMZvN0+5xaU4CZ6kARr2qiVlinjar2tsM3q/HwjQLaZFcm3YlaLF0It6ho9Vmzda
         kayS55Ct4MjcW3HHrwqwln4cEGSeBC2h7mRjxdbHPpWamfQeP+ZY9AIuyuBpRoXnVU4D
         o76g==
X-Forwarded-Encrypted: i=1; AKwUvByiGDlmx3zcoAWTeo8BAuN1hLmtdYS8JSs9XH+uvy0yjx6cVKafQMo6J2bWPxwQ74Hdps7G8ikBE6My8Es=@vger.kernel.org
X-Gm-Message-State: APuU4Z/tz2DIYjlYBt9xgEAhbt+fsXZzC4iJXu+MtgkPt3HpeC8TTJqP
	y+2hH/bh6CVixzEFJePk1d9OsKSjw1+SV6p0dbskmBi8oqgIP2CxFqDyDJuFk94+gagsv/fYyj5
	c0BD8v5J3eJ7ToHbAPx9DLU5GNakmy4rWXPq5
X-Gm-Gg: AYBFou3cUcn+LwqAjLslrvI/nVryPEH8JKJuUd8dvBOXEZ9Y9kzgVmiyO459msZnv3i
	cqUrpo2zqabjrH9NxX/+zl5M/c5TE4Bt/EYCeI4xPyilSqljT4fd66bQHwbLkA8bSD/93JWgYwA
	ipxOrl66GtPQtVB5hwPhEI65rj/aV/qnYUCrkuVykiwYEB2gXnuuvQjSoZG+VN4THpCz+yaMNSq
	Xn9qSXWSWQ5Uojulc3wxvM7gDR7D//3ldm3WD0+TckaHYf/QchCezm+49WWay++7ESSYulEByWf
	1jKzaZnQlJkJ6dxIgo2O8468hQknLW+hV6JrjObQZtdkruRdeLzdhk5FHT+ZCbk27U39pGBg07D
	w8xIUEMVdX54wDPQDtwdcS7/ZQpxC22Cn02DzrAI=
X-Received: by 2002:a05:600c:4f0f:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4ac17b2cde9mr454931595e9.7.1793848031562;
        Wed, 04 Nov 2026 19:07:11 -0800 (PST)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.129])
        by smtp-relay.gmail.com with ESMTPS id 5b1f17b1804b1-4b57373e36asm2412705e9.10.2026.11.04.19.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 19:07:11 -0800 (PST)
X-Relaying-Domain: everpuredata.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id 0AFEF3403F8;
	Wed,  4 Nov 2026 19:07:10 -0800 (PST)
From: Tim Menninger <tmenninger@everpuredata.com>
To: Trond Myklebust <trondmy@kernel.org>,
	Anna Schumaker <anna@kernel.org>
Cc: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>,
	linux-nfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Eric Badger <ebadger@everpuredata.com>,
	Jon Curley <jcurley@everpuredata.com>
Subject: [PATCH 0/2] SUNRPC: let cancelled RPC/RDMA requests drain before release
Date: Thu,  5 Nov 2026 03:07:07 +0000
Message-ID: <20261105030710.2652306-1-tmenninger@everpuredata.com>
X-Mailer: git-send-email 2.53.0
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

Restarting a data server's NFS engine during sustained pNFS/flexfiles
READ I/O over RPC/RDMA can leave the client repeatedly reconnecting
after the server becomes available again. I reproduced this on Linux
6.8.0, 6.18.34, and 7.4-rc1.

Cancelling an RPC task does not establish that the server has finished
accessing its advertised Read or Write chunks. Releasing the request can
invalidate those registrations before the server finishes using them. A
subsequent remote access can fault the QP, disrupting other RPCs and
driving further layout cancellation and transport recovery.

This series lets eligible cancelled RPC/RDMA requests remain available
for normal Reply-driven cleanup instead of immediately releasing them.

Patch 1 records the first RPC error and any (possibly subsequent) signal
indication in one atomic state. This allows a signal to interrupt
optional draining even when an earlier cancellation error is already
recorded, without overwriting that error. Accepted RPC restarts clear
both together atomically, leaving the behavior from commit 5bbd6e863b15
("SUNRPC: Prevent looping due to rpc_signal_task() races") in tact.

Patch 2 adds transport-controlled deferred release for cancelled
asynchronous tasks. RPC/RDMA opts in while registered MRs remain on the
same live connection. Wake callbacks retain their transport status, and
waiting uses the existing request timeout and transport timer.  After
normal no-reply timeout handling, an already-cancelled task exits rather
than repeatedly re-entering draining with an expired timeout.  A request
whose Reply completed before release no longer triggers its previously
requested conditional disconnect.

Testing:

This series is based on v7.4-rc1.

There is a patch in
https://lore.kernel.org/all/20261105000131.2512336-1-tmenninger@everpuredata.com/:

  pNFS: avoid repeatedly cancelling I/O for the same lseg

which is required to cleanly observe the transport-recovery behavior.
Without this, my client livelocks after NFS restart.

There are also two strict prerequisite patches in
https://lore.kernel.org/all/20261105020249.2607367-1-tmenninger@purestorage.com/:

  SUNRPC: add request-scoped disconnects when cancelling tasks
  NFSv4/flexfiles: limit transport disconnects when cancelling I/O

Those patches are required for applying this series and are required to
observe full recovery after DS restart.

Finally, I applied the patch in
https://lore.kernel.org/all/20260823134640.3083136-1-tmenninger@everpuredata.com/

  xprtrdma: serialize unmap_sync with xprt_disconnect

to avoid a separate disconnect-time deadlock. The described reconnect
storm makes this otherwise rare condition easier to encounter.

The principal workload used one client, one MDS, and one DS, with
RPC/RDMA, nconnect=16, sustained direct READ I/O, 160 threads, iodepth
64, and 1 MiB I/O.

With this series in the tested configuration, restarting the DS's NFS
engine restores full throughput and normal operation in approximately 20
seconds, matching the expected recovery interval.  The continuous
post-recovery reconnect loop is no longer observed.

Related experiments:

While not the direct cause, this is exacerbated by commit b739a5bd9d9f
("NFSv4/flexfiles: Cancel I/O if the layout is recalled or revoked").
Skipping this behavior for RDMA xprt suffices to avoid the issue during
DS/NFS restart, but the underlying issue remains that stale rkeys can
access invalidated MRs.

In antoher experiment, fencing MRs during teardown and waiting for all
request-release waiters before disconnecting sufficed to eliminate
protection error messages in dmesg during recovery, but does not slow
down the xprt disconnect feedback loop.

When applied, a separately posted layoutreturn-seqid change at
https://lore.kernel.org/all/20260921235520.502987-1-tmenninger@everpuredata.com/
leaves some workload ranks slow after recovery even though the reconnect
loop is gone. The cause of that interaction is not yet established, and
I've asked to hold off merging that submission.

Tim Menninger (2):
  SUNRPC: maintain an rpc_task signalled flag
  SUNRPC: let cancelled RPC/RDMA requests drain before release

 fs/nfs/nfs4proc.c               |  12 ++-
 fs/nfs/pnfs.c                   |  11 ++-
 include/linux/sunrpc/sched.h    |  21 +++++-
 include/linux/sunrpc/xprt.h     |   3 +
 include/trace/events/sunrpc.h   |   1 +
 net/sunrpc/clnt.c               |   2 +-
 net/sunrpc/sched.c              |  53 ++++++++++---
 net/sunrpc/xprt.c               | 129 +++++++++++++++++++++++++++++++-
 net/sunrpc/xprtrdma/transport.c |  33 ++++++++
 9 files changed, 241 insertions(+), 24 deletions(-)


base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
prerequisite-patch-id: 2e8f35e38c760c42d04307b131ce55f80df66fef
prerequisite-patch-id: e7030ad56461efdd80f97ab1e0790fd4593805a7
prerequisite-patch-id: 8be1a2d2043bc7c018bb8e85af50ef438786a2aa
prerequisite-patch-id: 17803adca3ad2c820fc719d6976327e5981adafe
-- 
2.53.0

