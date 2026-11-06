Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.232
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794007757;
	b=1KQ7n+ustUu3LuX11dV/twD/cnLUalwjg2agzSlSZkkBECqwlL/Eialc+PDobI8j+LPZ
	 v3BcwVpdO87rTVwb+6Qo1lXraRENicB/BAV5OLkWLYpX5G10VD4HW8tAWWa+zfLV6OkXk
	 qUoSHwnDJ/QcW7/HoS6A77bWtl5MTVHzwWS5cW3bAQDTRGerIcm42zTnXY8lzWeiXmaNa
	 9sTObMCEwa+1H+kbLSVLIN6whgTKr2oB5Rhbq/OMfepmkTUPOKIiLLBOWgreFurRALAyW
	 VVL6MpuE92nVK+X6XK6zSkwQipf2cK+Jtx/LVYWCOqdUYjKSDRPmCv4Ioh7/1XNpXBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794007757;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pnU+U4pwgALNgf0sM94ivT57kakLzMx+bbRDD/caJhk=;
	b=b4U0Ts2jI1n7L7bvfFOhYbNAj/bhIzmFjWAN3PaFxyF2zlyzmKcq7YmuJXG7bFC8Fxib
	 18ZfQGv1jyKyRNi67N5eV1wiEQZDvPt85h/d8VgVZA6juCtIyP1fS2qyyzOm59PT5q8dS
	 fuE2tOPMBM/TIMMNp7amaaUUIsw+HXhguLLnWiZz8Gpgs+AegoLNqDo5rPeLZODBNxJqx
	 w+osW4RNAWe2Bi3QEYij/b52lI2LepDJtUDx57dfGbfveUMLrK5lD4BpVKkP2CPrZct2X
	 K2JG9stqY1Pt7haCVXdGZ5t3CQGB5bfm2yV1hDSsbdh2+EBeiISazOOzm7pTt0tgidQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=everpuredata.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=vQnEBQVM;
	arc=none smtp.remote-ip=209.85.215.232
Received: from mail-pg1-f232.google.com (mail-pg1-f232.google.com [209.85.215.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845CB606A326
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 23:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 845CB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=vQnEBQVM
Received: by mail-pg1-f232.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so526123a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 15:29:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1794007755; x=1794612555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pnU+U4pwgALNgf0sM94ivT57kakLzMx+bbRDD/caJhk=;
        b=vQnEBQVMO+QnfGuxd3pMG+Poh1HXhUmOrVuhSc8LH62am8bk9XxGHXhGsaptX1nbbD
         6JBrAQvAfzZLo1fWisbrjc0MzRgCjQD2DpzVInUpTD8HOOtQwlFw3rDOggkXJIRj8yee
         zI1mKn9qZkMllt/u3FPriMjQKY1LJd5yt7K8dEwbhBpbPUzDOCwiZGRT8NaaDgi+l2hG
         5gZjfbUdg4Xnn+ynBVF91gG4t/wgT9Mq9NmoOHn2nmNfJR5p1xKgAgyPW8pzN+CDYi76
         AjaM10PRWweMu9a1yIyZB85MOMQZ9h5op+Su1rY65arnlavzJMB6WjEt5mnN3c+onifY
         EHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794007755; x=1794612555;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pnU+U4pwgALNgf0sM94ivT57kakLzMx+bbRDD/caJhk=;
        b=b3Gcdd4zC1UB0ooTHujjIovR2n4mlXDkETVp0rIR56apy6pI0Fd+eV1a8bLFSRiWQF
         U9uNrqBE9A+OhAqteIbKCrKQ3p7lTZOEKCupuqsqxqbs2pQ99fhY/dprcwCnZNrc9r7C
         NCG/gPxgqIa6mCF+Qq9qth3auTfVPPUNBAAzd1OhR1YeKRHn0YApbjD9+J0Uma/pZlQB
         Ry/9Sk56Q9wFXcb+6xlZ4lSZMjFgtEMMQxEKjJLDA4l5qmWOOykakujijQupzsKWPbjd
         qYtWfkDD9doNxlWkrxdzN0/bgdFDqdsZOuquOdoTvy/tOLEmVzBE781JFzdBc/C0VI7W
         x0hQ==
X-Forwarded-Encrypted: i=1; AL+hErEDkANUIjWdyzJgpvYgJolbIOED5NqxwORDuE2Iscrd3eSW9SAjQ28Eafe3GcAq6EEXGU+q1H8et+ZazRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z90juUe0+A00DQVYIMV15qI2NwQneJRGc9zn/DjClS+as0uC/ya
	KqxcBYFtlvs3WvJLpu+1TUS+nKAd3im3jyloiSVJnXYE6SxtbEMax9pVHVGP+rrgINhZek6Li43
	gdqV13VkCdRqbhTtFCx5R+opR7f1WeMX6iEV+
X-Gm-Gg: AYBFou2IquOO2ZDj3G9ideSDrp+PEIWVKClOeMfgYBuzoJjg/+zJG6AnUV+lLyTH3Ve
	p5Fwus6CjZHv+HYv2BXByRDdAfcSwPVGz7nINh80ObN4/Zur9n20sX2WzzcDo2hO7kWqnzn8Gbs
	ftUZp30sVKDDPGJOBsiFfJ3lAJufSvZO6+5OJqY2rqUXfLERDF7NzvZ7otFpwTtu+oxl/2wqzG6
	/oaV2pG5NvtvUr7nYVN9kWAd9BLVmzXrJ2pe8fSwAERszoyoo3Pp8R8QHlv1+2Ghv6CXvY2gBVr
	tvQP3duUAxUYm3ow7HgYBoceyJhcx07ozzkFiN0McoAJPI5U6+oeqlp0Lf2AvN+afV62IcxmqkY
	gV+FqA9fohznZfoE08PyL9ezyrbj5V+R8FAXi3hs=
X-Received: by 2002:a17:90b:3b43:b0:3ad:1b31:92d8 with SMTP id 98e67ed59e1d1-3b0db732ef4mr3775473a91.60.1794007754776;
        Fri, 06 Nov 2026 15:29:14 -0800 (PST)
Received: from c14-smtp-2023.dev.purestorage.com ([208.88.158.129])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b10581c3b0sm406284a91.7.2026.11.06.15.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 15:29:14 -0800 (PST)
X-Relaying-Domain: everpuredata.com
Received: from irdv-tmenninger.dev.purestorage.com (irdv-tmenninger.dev.purestorage.com [10.32.149.15])
	by c14-smtp-2023.dev.purestorage.com (Postfix) with ESMTPS id 367F13400FE;
	Fri,  6 Nov 2026 15:28:44 -0800 (PST)
From: Tim Menninger <tmenninger@everpuredata.com>
To: trondmy@kernel.org,
	anna@kernel.org
Cc: cel@kernel.org,
	ebadger@everpuredata.com,
	jcurley@everpuredata.com,
	jlayton@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	netdev@vger.kernel.org,
	slingappa@everpuredata.com
Subject: [PATCH v3 0/2] SUNRPC/NFS: limit transport disconnects when cancelling flexfiles I/O
Date: Fri,  6 Nov 2026 23:28:41 +0000
Message-ID: <20261106232844.2176820-1-tmenninger@everpuredata.com>
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

This series narrows the transport disconnects performed when flexfiles
cancels I/O for a recalled or revoked layout segment.

Today ff_layout_cancel_io() first cancels matching RPC tasks and then
calls rpc_clnt_disconnect() if any tasks matched. rpc_clnt_disconnect()
operates on the entire rpc_clnt, so for a data server client using
multiple transports it disconnects transports that may have had no I/O
associated with the affected layout segment.

I encountered this while testing pNFS over RPC/RDMA during data server
recovery. Restarting the NFS service on a data server while sustained
direct-read I/O was active could cause repeated reconnect activity and a
large throughput drop. The client-wide disconnect from
ff_layout_cancel_io() amplified the disruption by tearing down otherwise
unaffected transports.

The first patch adds a SUNRPC helper that combines task cancellation with
request-scoped conditional disconnects. Matching tasks are cancelled as
before. A subsequent transport-queue pass marks matching requests
belonging to the same rpc_clnt that remain on the transmit or receive
queues. At release, transmitted requests trigger a conditional disconnect
using rq_connect_cookie.

The marker is consumed under xprt_release()'s existing transport_lock
critical section, so the normal request-release path requires no
additional lock acquisition.

The disconnect state is stored on struct rpc_rqst rather than struct
rpc_task. A task can release one request and later acquire another, so a
task-scoped indication could otherwise be consumed by a successor
request and applied to the wrong transport generation.

The request-marking pass also preserves the rpc_clnt selection used by
rpc_cancel_tasks(). An rpc_xprt may be shared by multiple rpc_clnt
instances, so requests belonging to other clients sharing the same
transport are not marked.

The second patch switches flexfiles to the new helper, preserving its
I/O cancellation behavior while avoiding client-wide transport
disconnects.

Testing:

I applied the following because, without it, the client enters a
recovery livelock before the transport-disconnect behavior can be
observed cleanly:

    https://lore.kernel.org/all/20261105153507.3145077-1-tmenninger@purestorage.com/

I also applied the following fix for a separate frwr_unmap_sync() hang
that the reconnect churn makes easier to trigger:

    https://lore.kernel.org/all/20261106142039.1066437-1-tmenninger@everpuredata.com/

Neither change is a code dependency of this series. Both were present
in the test tree and are recorded in the base-tree metadata below.

As a control experiment, I also tested skipping the
ff_layout_cancel_io() task-cancellation and client-disconnect path
entirely for RPC/RDMA. Doing so eliminates the reconnect pathology. This
shows that the pathology depends on the cancellation/disconnect path
introduced by commit b739a5bd9d9f ("NFSv4/flexfiles: Cancel I/O if the
layout is recalled or revoked"), but simply opting RPC/RDMA out of that
behavior would also remove the cancellation that is intended to drain
I/O associated with a recalled or revoked layout segment.

This series instead preserves that cancellation while limiting transport
disconnects to matching requests that remain in flight.

I have repeated the data-server restart test many times and the behavior
is consistent. The counters below are intentionally collected after the
restart event, once throughput has partially recovered and the client has
entered the post-recovery state in which it remains until the workload
completes.

This distinction matters because some transport activity during the
data-server restart itself is expected. The problem addressed here is
the continued reconnect activity after that transition has completed:
once recovery has settled, the client should not continue cycling
otherwise healthy RPC/RDMA connections.

Over approximately 30-second post-recovery sampling windows, RPC/RDMA
disconnect events fall from 1,965 to 276 and connect events from 1,964
to 277, approximately a 7.1-fold reduction. Read throughput improves
from approximately 0.4-1.1 GB/s to 1.9-2.2 GB/s.

The sunrpc:xprt_disconnect_force count reaches zero, but conditional
disconnects do not emit that tracepoint. The RPC/RDMA event counts
therefore provide the more direct comparison of transport activity.

Before (throughput: approximately 0.4-1.1 GB/s):

     Performance counter stats for 'system wide':

                 1,964      rpcrdma:xprtrdma_connect
                 1,965      rpcrdma:xprtrdma_disconnect
                 2,685      sunrpc:xprt_disconnect_force

          30.018975301 seconds time elapsed

After (throughput: approximately 1.9-2.2 GB/s):

     Performance counter stats for 'system wide':

                   277      rpcrdma:xprtrdma_connect
                   276      rpcrdma:xprtrdma_disconnect
                     0      sunrpc:xprt_disconnect_force

          30.048495495 seconds time elapsed

---
Changes in v3:
- Protect rq_disconnect_on_release with transport_lock and consume it
  in xprt_release()'s existing critical section, removing the additional
  queue_lock acquisition from the normal request-release path.
- Factor out xprt_conditional_disconnect_locked() to preserve the
  connection-cookie check without reacquiring transport_lock.
- Add a read barrier on the marked-request release path to order the
  dequeue fast-path runstate checks before reading rq_ntrans and
  rq_connect_cookie.

v2: https://lore.kernel.org/all/20261105020249.2607367-1-tmenninger@purestorage.com/

Changes in v2:
- Rebase onto v7.4-rc1.
- Adapt to the device-ID-aware ff_layout_cancel_io() interface,
  preserving device-node reference cleanup.
- No functional changes to the SUNRPC implementation.

v1: https://lore.kernel.org/all/20260924204525.3381590-1-tmenninger@everpuredata.com/

Tim Menninger (2):
  SUNRPC: add request-scoped disconnects when cancelling tasks
  NFSv4/flexfiles: limit transport disconnects when cancelling I/O

 fs/nfs/flexfilelayout/flexfilelayout.c |   7 +-
 include/linux/sunrpc/sched.h           |   4 +
 include/linux/sunrpc/xprt.h            |   5 ++
 net/sunrpc/clnt.c                      |  94 ++++++++++++++++++----
 net/sunrpc/sunrpc.h                    |   8 ++
 net/sunrpc/xprt.c                      | 107 +++++++++++++++++++++++--
 6 files changed, 198 insertions(+), 27 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
prerequisite-patch-id: 2e8f35e38c760c42d04307b131ce55f80df66fef
prerequisite-patch-id: e7030ad56461efdd80f97ab1e0790fd4593805a7
-- 
2.53.0

