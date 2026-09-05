Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DFB33A9D1
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 08:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788596330; cv=none; b=fFmvRtxmrp/udD+HyV3jkof+rpxA54bJ45aF3pf8XyTgop/1AsRKMrfbyhYHVP9yK8KpLMG0Gqt8H40zczvzXAOz2eEcDMf+VogTZi3Xs487eECLntLUvx0lSi6oLw5t0KusH0XCB9DMa/hIqE1hY1P7xxD/m59yaNeosiRZuLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788596330; c=relaxed/simple;
	bh=UleVRLQeX7/EZv2DQznaxHjkonPd/+d0J49jgGtExWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3ROL4wNjPTeDEGr3rfenr4i0QTEEVxxudvtZIP1f5e2PcG1ClPt1yRdrQI1nKqUk/NIpTwILd4x9vgSrH0RKkUG8K9iPZd0K9XTcAv5P4IpEPODdgyFTbsmq0MzBklCfAXrLnb8xBG1Y7S+gLlD6HN9P8Q06HaBx1Zl5LNmvG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=oFKF96FE; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="oFKF96FE"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso1545106a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 05 Sep 2026 01:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1788596323; x=1789201123; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6n+MxWK/M6q3SzPBPjKueM2StMDrv+VHYWiWFtLihRY=;
        b=oFKF96FEEwBYCEoa/UlT8ZGgimBWQr2heae9059rPZV9V2ETSlks0I5DBGkA2mlsZa
         Bcm+zdhornhSigjGo5wlKGxZ44hj/f/ThDB38EuPMAFyG6Im38xcKUC1GUcR0s7NGQcf
         Ly0ipmBIJIwUN/99hDSkaIiMs7UOShdcgj8O/Xcw8mBHpOJM1ROtu7fjIpGAhDzTXqFE
         l1KvjtaOE6MslG5kF4ppQrNEFbwaCviu++4t8aUlT6rlQfwomPq8znhqFU9QnFNcqsof
         Rlr3g+2MrD4Nr0ZDTwoNb1c/ZqUgVhD/duIKnnwXl9vUzLgSxzjBOXhTnpZnbtU8s/hM
         dxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788596323; x=1789201123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6n+MxWK/M6q3SzPBPjKueM2StMDrv+VHYWiWFtLihRY=;
        b=mC85sIc52D9oY+W/evX1jiYI3TM07gZY8edVq/abYLx9RlgTl+xPDTHSsl3vJfcb+Y
         gaEJ82Pc2xMkHVn4lUbaTir90TFTibBSxHEUcuutygR0YcyTT2PuJVWJv+OksJcIuSZ0
         KmttIFQhcPTU+6vzv1q1VBBb9thMDChMC21tTT31BVxbk/lVAOaRhj86QxDQZJ4UkJDv
         tTlEu81RYp0H6DYzYqsNwKnhmJj02ckO9vi2LlE1s85YLdInCY7aCUaNOSg6Zi5Q6N3n
         eFfNX9ZV5hE7u9RqUkQ+cN9I8pZ9B2ilFvMc2eW6EEi2luWIrKqLHoTTGAkYMo0VVGvE
         ix9A==
X-Forwarded-Encrypted: i=1; AKwUvBwSDZXqg1JSNBHw7lBBZ49QY1PjfcQIvcq0RuMz3dDabAkGugS9j1SYLma3iYk6GW9guzDOCN7TlftCM9I=@vger.kernel.org
X-Gm-Message-State: AFuF++miZBmspDp3H1qD28soz1uCkjatxtWWqGzpmxbfxkaJ2AfsFLAW
	ZW1l7hXIfedKBj9Si1SGk06881rgZslFmUGF/QKi/QM1vpOk/hgeiwHiy8ocJbtAn/78
X-Gm-Gg: AYBFou0Xj4RUTclIf6KzVz57gVC072lr0WeIAvVinznRbZxaUOlxl3zPwrBWnAaHeb3
	boZ6ciWUY/zdtQlZhkpvlcdQTlCE8P6RxH5NxCXjphOYywXmT/KXlqm73AHl/uyPsWrhT5w40XT
	9I1/EQB2m1/0fYG6vs4Cet7xiXJ2CAKBHZXCJQjje9UnYe3FwKNM5kYl9C9Alw7bCUPqjjI+ysW
	GncFQdBQPzYZxFqeuR4oga1LvbRMJPYhAOnUoWICAHD02yU6rtdBDBBjLC71eVjTsMhtrFUdhXR
	9TeZvsKownUuta0Xa92ag06UsaRgjmDpTP1SmOQPCtoYFbamp2454IOcC09ouhtZqY5PHmmZItk
	88WV5xjuQYsaAx+ij1al0mmyy8ahoUY28WouRJhCotDYiGaX5THFDXV5kDwvoZwVkO+eSzU3dCO
	d0W0rRR6Awh0ldZe9fbMlOzoAboMo2f1TVH4cS8357t3GBEQ9BOd9hYE8zLKGKC5R50nFWe0u1E
	AJZ8tB0U3723YxTzJM=
X-Received: by 2002:a05:6a20:7283:b0:3a0:bc61:62e6 with SMTP id adf61e73a8af0-3da39d0d473mr17840288637.8.1788596322675;
        Sat, 05 Sep 2026 01:18:42 -0700 (PDT)
Received: from b6ad5085b32f.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc455451b46sm1713049a12.18.2026.09.05.01.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 01:18:42 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: netdev@vger.kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Zihan Xi <zihanx@nebusec.ai>
Subject: [PATCH net v3 1/1] rxrpc: fix encap_rcv skb accounting exhaustion
Date: Sat,  5 Sep 2026 08:17:40 +0000
Message-ID: <a2bd6f3ed29919a7328363b548299ae583f052b0.1788539302.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788539302.git.zihanx@nebusec.ai>
References: <cover.1788539302.git.zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rxrpc_encap_rcv() moves encapsulated UDP packets onto the local
RxRPC queue without preserving UDP receive-buffer accounting. A local
AF_RXRPC service such as the AFS callback listener can therefore be
flooded with RxRPC-shaped UDP packets until the local queue grows
without bound and consumes large amounts of memory.

Reaccount encapsulated packets against the UDP socket before queueing
them on the RxRPC local queue and drop packets once the socket rcvbuf
limit is reached. Orphan each skb when the I/O thread dequeues it so
UDP ownership does not follow the packet onto call or connection
queues. Clear sk_user_data under RCU protection and release the
socket only after the local queues are purged.

Fixes: 446b3e14525b ("rxrpc: Move packet reception processing into I/O thread")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: LLM
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>
---
changes in v3:
  - orphan the skb when the I/O thread dequeues it from the local
    queue so UDP rmem ownership does not follow packets onto
    call/conn queues
  - mention both io_thread.c and local_object.c in the cover opening
  - do not describe the recorded panic as a complete non-root-only
    reproducer; the flood is unprivileged but I/O-thread starvation
    used privileged steps
  - attribute the OOM to skbuff growth rather than incoming-call
    setup
  - describe the recorded panic as a downstream OOM in
    rxrpc_reject_packet()/sock_alloc_send_pskb after I/O-thread
    contention, not as an allocation at the encap_rcv enqueue site
  - note that cgroup.freeze does not stop krxrpcio; the crash still
    shows that kthread allocating, and the CPU pin plus SCHED_FIFO
    hog are the steps that slowed it
  - v2 Link: https://lore.kernel.org/all/cover.1785339953.git.zihanx@nebusec.ai/
changes in v2:
  - switch the drop path from atomic_inc(&udp_sk->sk_drops) to
    sk_drops_inc(udp_sk)
  - retarget Fixes to 446b3e14525b, the first boundary where encap_rcv
    queued the skb onto local->rx_queue for later I/O-thread consumption
  - rebase onto current net/main
  - refresh the cover crash log from an unfixed 7.3.0-rc1+ net/main run
    and include the decoded stack
  - explain in the cover why packetdrill was not used
  - document the actual local flood command instead of a generic
    unshare invocation
  - v1 Link: https://lore.kernel.org/all/cover.1784742007.git.zihanx@nebusec.ai/

 net/rxrpc/io_thread.c    | 17 +++++++++++++++--
 net/rxrpc/local_object.c |  8 ++++++--
 2 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/net/rxrpc/io_thread.c b/net/rxrpc/io_thread.c
index dc5184a2fa9d1..8b77d137888ea 100644
--- a/net/rxrpc/io_thread.c
+++ b/net/rxrpc/io_thread.c
@@ -41,8 +41,6 @@ int rxrpc_encap_rcv(struct sock *udp_sk, struct sk_buff *skb)
 	if (skb->tstamp == 0)
 		skb->tstamp = ktime_get_real();
 
-	skb->mark = RXRPC_SKB_MARK_PACKET;
-	rxrpc_new_skb(skb, rxrpc_skb_new_encap_rcv);
 	rx_queue = &local->rx_queue;
 #ifdef CONFIG_AF_RXRPC_INJECT_RX_DELAY
 	if (rxrpc_inject_rx_delay ||
@@ -52,6 +50,19 @@ int rxrpc_encap_rcv(struct sock *udp_sk, struct sk_buff *skb)
 	}
 #endif
 
+	if (atomic_read(&udp_sk->sk_rmem_alloc) >= READ_ONCE(udp_sk->sk_rcvbuf) ||
+	    !sk_rmem_schedule(udp_sk, skb, skb->truesize)) {
+		sk_drops_inc(udp_sk);
+		kfree_skb(skb);
+		return 0;
+	}
+
+	skb->dev = NULL;
+	skb_set_owner_r(skb, udp_sk);
+	skb_dst_force(skb);
+
+	skb->mark = RXRPC_SKB_MARK_PACKET;
+	rxrpc_new_skb(skb, rxrpc_skb_new_encap_rcv);
 	skb_queue_tail(rx_queue, skb);
 	wake_up_process(io_thread);
 	return 0;
@@ -471,6 +482,8 @@ int rxrpc_io_thread(void *data)
 		/* Distribute packets and errors. */
 		while ((skb = __skb_dequeue(&rx_queue))) {
 			struct rxrpc_skb_priv *sp = rxrpc_skb(skb);
+
+			skb_orphan(skb);
 			switch (skb->mark) {
 			case RXRPC_SKB_MARK_PACKET:
 				skb->priority = 0;
diff --git a/net/rxrpc/local_object.c b/net/rxrpc/local_object.c
index 169f9dfdaa77f..6604f9f952660 100644
--- a/net/rxrpc/local_object.c
+++ b/net/rxrpc/local_object.c
@@ -437,8 +437,8 @@ void rxrpc_destroy_local(struct rxrpc_local *local)
 	if (socket) {
 		local->socket = NULL;
 		kernel_sock_shutdown(socket, SHUT_RDWR);
-		socket->sk->sk_user_data = NULL;
-		sock_release(socket);
+		rcu_assign_sk_user_data(socket->sk, NULL);
+		synchronize_rcu();
 	}
 
 	/* At this point, there should be no more packets coming in to the
@@ -448,6 +448,10 @@ void rxrpc_destroy_local(struct rxrpc_local *local)
 	rxrpc_purge_queue(&local->rx_delay_queue);
 #endif
 	rxrpc_purge_queue(&local->rx_queue);
+
+	if (socket)
+		sock_release(socket);
+
 	rxrpc_purge_client_connections(local);
 	page_frag_cache_drain(&local->tx_alloc);
 }
-- 
2.43.0

