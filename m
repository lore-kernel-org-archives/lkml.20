Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069613;
	b=pVkyAiO1EFnCwhmqKMMhgQ4yNmNLvJEYThS8/YBWjb6y0YETY4VjYJj7d2PQzbUNzDXR
	 5XQbvyROpCV0uK8J96st4jbA2nlJDJ1xC+BkYz1trzNCjxZXm/FOdTuDYqysmgcZKuW/K
	 ih/dV0ZfiG2oAjb5sjkcSqqk4Opjl4GLMrL9GCRhhxmMO6PEcD3VkiLnf52AsYZz9TN+x
	 I8pGDE2uPtww7VosKUpKgCGKpq69/i08pYn5tyIIShzHqGVZy6wkDSiLcVSWzauDhWCEY
	 e8VvG0oShDG1ykOatB/8MXqlly9jj2Vk9UWkIXXc+7n+ULnNM7kVZk36wwRVxiE3BEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069613;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=eANz6TxlfIefza3dEAFXrv5EtYoHJKoB5jG0laNfxhM=;
	b=zXMJf74+8D6baoeszJRpb7Akg+xB9PLUbXoK9AwSG+2cpAaTmx8TdG+XiqAGfCylcW3O
	 jO6jlpxhkxmFOOjiP5Sn2FrCnqhwRlOmfBPeGXbdCdA+twQRKQVFZlkwBOCBvzKbkHQ8O
	 1FpKoGJXC6H8mLfa4FR/tL90C2lOmbLeWbF2GD9ILhTdfDVWN7JQB0NOzTglQ3tGMo5jL
	 CuOFqiK9MKN0bAw0Ve1JvkcKeJuUmuGorzoR9d43412te57jeAm30z9VTB2q0yb1baO50
	 cfPK4QCWhaCKQ4DXCI4yBMuI4qfcNaR4BD2Mhim6z99VJ4hzksjD2mj4uPB4zJwTLtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Tn0O3HHY;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719C2606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 719C2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Tn0O3HHY
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ea0efd636dso29090475ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793069612; x=1793674412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eANz6TxlfIefza3dEAFXrv5EtYoHJKoB5jG0laNfxhM=;
        b=Tn0O3HHYIF1+ZfJmwl6m2ZLfVwiu9AaVwwAf9P/buaKYIuLsrryCp8gZj5a5vpNAGc
         aiCQq9gB14QdZTDdvABdCKgOFqeTYSBhqQFfh6GvOaAljW4rjdOowcUMh9ZySrXJ9NdW
         OnxqyiAwTPqQy7LTTaxdMS6UYIpTTSpxfpuYDzEJygFdj7XpBYKZqoShcdQG99d/3hUW
         a5741df0ILndRCksQmx/ah0q5LS8Dj6dcB2KJ7NPZk9xCI+vIxTM8R6wV5B5bAbjc+or
         hJUeIj9sQSHpUkQZv1dE+UX8aELf+6Np+dTsjW9JyDVvtyty2+MzQDBNJE+pQtTAfpTT
         CapA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069612; x=1793674412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eANz6TxlfIefza3dEAFXrv5EtYoHJKoB5jG0laNfxhM=;
        b=p8ol4EDkvIs9tWbmmeTonvlub5fSvFgGLcBUjz/mJVRC71NF0deAgw/4CK6EGJxGkf
         iPdeKLRye7zI5cnGzBpcSClF4d/Rwue6rdp0Uji90zQd43vrz8A/3FDZfdD83Ig0w8RM
         4Zarlaj6FEVoa35vye6xExJ+qYu9F7ieLyFIZlaQTtr5yR4N6jL4Ae3J7BTe8VRN0ecS
         s9ArkkJ5PSGLtR2aBAMqOGyV1WNgVcXxFYFQO6Acv62WJvqpv3ff8xy1tq/fN6/PFTSK
         A3hPh8P2CdwrQgqUFyWgaihR0YwQatYAnLleK+rkSbvtz/HcKf0WLWUPOghxWo2MZyCD
         gBtw==
X-Forwarded-Encrypted: i=1; AKwUvBwTVijAMgOIRLdN7YKHrStPOr/ia+6WBZMfyBVFKKAaZdwc1xUzr6h8CR0aOMDHmOHzxO+tR2y91Dk+MK0=@vger.kernel.org
X-Gm-Message-State: AFq9FYITsmopNBYldkS6fAwXthm/ql1NluEstAWwc09kVx8+5DvTsxO3
	NEWYturGX2N9wcyrz2TAKttBKL4OV9v4utKvwl3iqZYDqcA44Jr8z54/
X-Gm-Gg: AYBFou1v9ure7pPuGu3xxM+DZJmq1UqVhoNqsHVy07C57awESnsObOaxBIkVVvPiDH5
	IOdRhmI9IHwZIMunyVM32Ejbxbc4Z8htsGw/BIsiABsvMoNfm5xlmwXL9XrPRNs4SJ/c6oX/dF5
	BdxP13Bzz6KNy8O04fz54dgcE3nVNi6DQWowP+PKiBltfLiRkMGeafGMIgIr+hA2UPZ+/ULHbgS
	RSgN+JOX6ncy5WZau0h0WQUCTIsrg9xRMEHRzMq2EmKkgHydXE2Swk2w8LoKa8AJ83xNpZ2Sa2V
	JUGlsIh1semAzNcw45cdGy3BnGRgs4TI+h7/i9JiDSQZlfHb7aU0m1g5HQXwJ94YGWiDaVYxZw8
	a66r0QAn/jkmp4C6D3IB5B9/4JvJWPD8ylyjV3lRke/Lq7s3VQAhowRejrxRR6Du+2Z1+hTdqrr
	j1qax6Avq1tYveTFbZOU5HupRpdb7gnKGh7fmbSssCv0e/IaAeUF5mALfokGPwzBvsEGdhT7yUD
	MPtFbK11iA74It8gAPba8FuqzyHiLxnv4SAOnjb83fPVRrLrVk=
X-Received: by 2002:a17:902:db07:b0:2e5:a355:56d8 with SMTP id d9443c01a7336-2ea9c87704dmr79704695ad.42.1793069611711;
        Mon, 26 Oct 2026 19:53:31 -0700 (PDT)
Received: from localhost ([111.228.63.84])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c8f24esm2216125ad.57.2026.10.26.19.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:53:31 -0700 (PDT)
From: Cen Zhang <zzzccc427@gmail.com>
To: mark@fasheh.com,
	jlbec@evilplan.org,
	joseph.qi@linux.alibaba.com
Cc: heming.zhao@suse.com,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	baijiaju1990@gmail.com,
	jjzuming@gmail.com,
	zzzccc427@gmail.com
Subject: [PATCH] ocfs2/cluster: cancel peer work synchronously on listener shutdown
Date: Tue, 27 Oct 2026 10:53:24 +0800
Message-Id: <pm-ocfs2-objects-candidate-0090-v6-127847d463212a41b773@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Listener shutdown must cancel delayed peer work before destroying the
o2net workqueue. destroy_workqueue() drains the work that is queued,
but delayed work whose timer has not expired is invisible to it and is
queued onto the freed workqueue when the timer fires.

o2net_stop_listening() currently only disconnects peers that can still
be found in the node table, and o2net_disconnect_node() cancels the
delayed work without waiting for a running instance. Two paths leave
armed timers behind.

Node removal disconnects a peer before taking it out of the table. A
heartbeat-up callback sees the persistent error and rearms the connect
and expiry work in between, and the listener shutdown then skips the
peer because it is no longer in the table:

  Peer removal                       Heartbeat / listener shutdown
  ------------                       -----------------------------
  disconnect peer; cancel work
                                     heartbeat-up: rearm delayed work
  remove peer from node table
                                     stop listener
                                       synchronize heartbeat callbacks
                                       skip peer absent from node table
                                       destroy o2net workqueue
                                     delayed-work timer expires
                                       queue on freed workqueue

For a peer that is still in the table, o2net_connect_expired() may be
running while o2net_disconnect_node() cancels: once the disconnect
drops nn_lock, the expiry handler requeues itself and the connect work,
and the flush does not wait for those timers either.

Cancel the connect-expiry, connect and still-up work synchronously for
every peer slot after the disconnect. Expiry can queue connect work, so
cancel it first. Heartbeat callbacks are already disabled and drained
at this point, a removed peer cannot hold a socket container because
that pins the configfs item, and connect work for a removed peer stops
once its node lookup fails, so nothing rearms after the cancellations.

KASAN report, only the relevant frames are kept:

BUG: KASAN: slab-use-after-free in __queue_work+0x1189/0x1600
Read of size 4 at addr ffff8881169069c0 by task swapper/2/0

Call Trace:
 <IRQ>
 __queue_work+0x1189/0x1600
 call_timer_fn+0x176/0x540
 </IRQ>

Allocated by task 486:
 __kmalloc_noprof+0x2de/0x780
 __alloc_workqueue+0x61/0x17a0
 alloc_workqueue_noprof+0xcc/0x130
 o2net_start_listening+0x139/0x7c0
 o2nm_node_local_store+0x4c0/0x810
 configfs_write_iter+0x2f9/0x4f0
 vfs_write+0x639/0x1010
 ksys_write+0x111/0x200

Freed by task 485:
 kfree+0x308/0x580
 rcu_core+0x6be/0x1ed0

Last potentially related work creation:
 __call_rcu_common.constprop.0+0x80/0x280
 pwq_release_workfn+0x740/0xe10

The buggy address belongs to the object at ffff888116906800
 which belongs to the cache kmalloc-1k of size 1024
The buggy address is located 448 bytes inside of
 freed 1024-byte region [ffff888116906800, ffff888116906c00)

Fixes: 98211489d414 ("[PATCH] OCFS2: The Second Oracle Cluster Filesystem")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Cen Zhang <zzzccc427@gmail.com>
---
 fs/ocfs2/cluster/tcp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/ocfs2/cluster/tcp.c b/fs/ocfs2/cluster/tcp.c
index 8b3830b601ba..b0cafda827bc 100644
--- a/fs/ocfs2/cluster/tcp.c
+++ b/fs/ocfs2/cluster/tcp.c
@@ -2200,10 +2200,24 @@ void o2net_stop_listening(struct o2nm_node *node)
 
 	for (i = 0; i < ARRAY_SIZE(o2net_nodes); i++) {
 		struct o2nm_node *node = o2nm_get_node_by_num(i);
+		struct o2net_node *nn = o2net_nn_from_num(i);
+
 		if (node) {
 			o2net_disconnect_node(node);
 			o2nm_node_put(node);
 		}
+
+		/*
+		 * Delayed work can be rearmed after a disconnect: a heartbeat
+		 * callback requeues it for a node that was disconnected but
+		 * not yet removed, and a running expiry handler requeues
+		 * itself and the connect work. Work waiting on its timer is
+		 * invisible to the flush below, so cancel it synchronously.
+		 * Expiry can queue connect work, so cancel it first.
+		 */
+		cancel_delayed_work_sync(&nn->nn_connect_expired);
+		cancel_delayed_work_sync(&nn->nn_connect_work);
+		cancel_delayed_work_sync(&nn->nn_still_up);
 	}
 
 	/* finish all work and tear down the work queue */
