Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334093;
	b=MS4Rc9lqLr74GzJULCnRhbZMNsTVe6vPIp2Y3hBO9QKM1TLdnN9YADvjm6Th5P5W48vL
	 Yat5EoWUYlbkjgbDQYMnCmj/OJeD0v1g+SUZGN4DwFs6PEr5qNZmsUvhJYm5g5bI7f1YJ
	 TmaJWmtoWFbdrNLDFf76pz34EnlAQMFs57dS/8f3+Z4f+Hp/tkTjER1PNzLhxEMIbOwri
	 H55FPgzZ0UqjiBrK5Xk1wLilqJjaejTqKKaSHtTDLM15xVTGn+oBFO0qZYVqz2nlxgwbK
	 f1KplXAsnYU9GXhp5AAD7GsrDwfDAmRJf07aRlAyh1ncqNQKF9GDYPDzssvmtkPNWZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=m+UvCR40zLeBZiNhlvIBvCGxKCDmbVOiWwxKAegnpmc=;
	b=M3CTC0orT6RXb3GHKlLhDDGHC5p9qBVzEL2in1YKvRUl4FjxA2xJOTm/RpEp4fOxWZ7q
	 D5ebJjH5Mh9nhkWjq2ejZnBLZhvXOxnSK48NZKhkXsJxwZ4ZvS+ZCx+ORSq8Etj5byNkE
	 VtjVvQ0S/TovQlYQQzmyh7wgRKH27H+N70R4atzJlTG5vqKMZ1oxcb/lfkIT4jf95Dv1w
	 +dTWLs29rkhHQPiZ51eqmp2K3gm6VJEkiK99CC8ZlGGGRNMNvER4vBlaYHRWZty3BPw/P
	 4atbMmvECU4g07QEL/agHwREFfHcyr0gy8TJnqI/qBoe8Gl4IxtlBVoinBlIcVwmXqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=aw21dDBZ;
	arc=none smtp.remote-ip=209.85.161.50
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6069606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6069606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=aw21dDBZ
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6b1afdf5196so81270eaf.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 21:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1793334092; x=1793938892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+UvCR40zLeBZiNhlvIBvCGxKCDmbVOiWwxKAegnpmc=;
        b=aw21dDBZ39a0BZ1Pwg/laBtRlVRZ9zJrcVN/8T3X44Th5/D73o9RLTgP1OBRddcEfI
         GV26wzWBoEuuw7MH/35MaEL1fB9tx69z7D9OMTt3GHMNFayr42/D+aUMMnA/J27N9oO8
         pE9GhNIdop9I5hAIL3PXyHU62WrcVThEkHHJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793334092; x=1793938892;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+UvCR40zLeBZiNhlvIBvCGxKCDmbVOiWwxKAegnpmc=;
        b=ksYQfKV7BIpU2asiVoCOgzZr/a2/3uPcABojcsTeg7OVGejSD8vl+ZmwKu+ioX+fg5
         JnyMNsi7uEQnogtotOw4OwPop7RJxc8vau+zySCAlWq9miY/vx2L+DVWvdxR7j9OotQx
         J7d8U1htWGfgq5w7pHJNz1Ekrev++EAXDKRkEj0DlT2AW7IlHYkgIY3gSbMzRp1AsdrG
         DhapcJHShqJUk32BBpooHtwwOEmonQ+iBCcqOQMPt5m1DLDcJqd9N6t/+0jVpMsujln5
         EyLDanWfmvgR2Jo9e1xFiRy/56x5E4kytB+/L/IRuCJaU/Z2vxJ4TvH8tCZjSpBQuaGu
         ZcGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCL2gAKeoaf4COsvrRD/wkueJLc0wv6VROQxfUL5wkQ+TzAPh/VG5ezmkG1WtyUjkw3tA7dh8YfZE0QGY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLCBfcFpOEaqC1WU6QlcspNVg7Om0Y4w9ZZpfX7O0dwyDCgK0AM
	WC2WwXNblj2eawuaIq/kXeKFTYCk2Jt8IYsXOaoyWQfk8Qxb2O+hl5LwJANsp4mlCFM=
X-Gm-Gg: AYBFou3gAKrtT7ov1BMqzLFnWwPI6xNhSavYvrqiuRRyaCVNpHKWU8xZ3MaaVQKQ/Dw
	NO7NF7wY6By5fpjMzd4u4yNofXbI4vKfofJscTisq8nNGxRfMsXY8AyAfxEswz2EIguvWQbrXv4
	ugUxdJ03BsUnbfkanRF24qGQP+CMwNb0+WY7I9xnXUtzsVmcsBmMFO9tG9dnLapFgB/CfBhO31b
	OvYsYcvLFgDUjARyZDzdaJh8agvAgsyDgLrArTUGvwGaxXeCY5oO5zpZ3REGyCENeJmONTvJrTx
	HVCk6Z74GLEamf07rZAmFuFda/qAXeLJ6u6zkJm+DrE5EYo2wjUgr9ztGPiM6CpuR0/w0al8xgO
	WBYLqbknetNSe/NMDEFASTsjgYUYzy2MsTKvKPHdIAhQVDN22+6fBNJj9kvqaEa9ZRZO+EW/qF6
	Gic8MAMq5sLTlTTLrEPS3GItBAZHJUMHrZ7txKJEqRPVykfx1OUO641Bn+eVutnzBsSkvxA2i7a
	fXJwi75p97ctM75PCahcu/Dktp6cDB6jhDiirnCZ71Zf56bH7eMdI7jnZqqhe932Wbbz4zAD0Hr
	fJF+XVPXZcLpvpfXE+dBEzJA2D3uupzQwknYEaVrrxqRVG1BouPvRJWVyj0Em6R4/Q4YLPnkxaz
	SKtB7zEFtm8plH+vcA/DDA/cS9nIWgQ==
X-Received: by 2002:a05:6820:806:b0:701:e4ae:d394 with SMTP id 006d021491bc7-714f2a0774bmr778691eaf.75.1793334091650;
        Thu, 29 Oct 2026 21:21:31 -0700 (PDT)
Received: from com-75606.corp.openai.org ([199.47.143.5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a90af4c879sm807971fac.13.2026.10.29.21.21.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 21:21:31 -0700 (PDT)
From: Kyle Zeng <kylebot@openai.com>
To: linux-afs@lists.infradead.org
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	outbounddisclosures@openai.com
Subject: [PATCH] rxrpc: Serialize client connection IDR updates
Date: Thu, 29 Oct 2026 21:21:29 -0700
Message-ID: <20261030042129.73690-1-kylebot@openai.com>
X-Mailer: git-send-email 2.55.0
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

The common connection destructor calls rxrpc_kill_client_conn() for
service connections as well as client connections.  A service connection
gets its CID from the peer and never owns an entry in local->conn_ids.
Its destruction can therefore remove an unrelated client connection.

The final reference can be dropped by the service reaper or a call
destruction worker, outside the owning local endpoint's I/O thread.
Client connection destruction can also run off-thread, and can remove an
ID already released by rxrpc_unbundle_conn().  These writers can race
idr_alloc_cyclic(), corrupting the radix tree and its RCU callbacks.  A
second removal can also delete a new owner after an ID has been reused.

Only run client cleanup for client connections.  Restore a per-local IDR
writer lock and the client-ID ownership flag, clearing the flag under the
lock when releasing the ID.  Serialize IDR destruction with the same
lock.  This covers deferred final puts without changing connection
expiry or the RCU lookup path.

Fixes: 9d35d880e0e4 ("rxrpc: Move client call connection to the I/O thread")
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
I have a reproducer for this issue and can share via DM

 net/rxrpc/ar-internal.h  |  2 ++
 net/rxrpc/conn_client.c  | 17 ++++++++++++++---
 net/rxrpc/conn_object.c  |  3 ++-
 net/rxrpc/local_object.c |  1 +
 4 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/net/rxrpc/ar-internal.h b/net/rxrpc/ar-internal.h
index 865f05fe37ab..5e49fe0f4a6f 100644
--- a/net/rxrpc/ar-internal.h
+++ b/net/rxrpc/ar-internal.h
@@ -377,6 +377,7 @@ struct rxrpc_local {
 	bool			dead;
 	bool			service_closed;	/* Service socket closed */
 	struct idr		conn_ids;	/* List of connection IDs */
+	spinlock_t		conn_ids_lock;	/* Lock for conn_ids */
 	struct list_head	new_client_calls; /* Newly created client calls need connection */
 	spinlock_t		client_call_lock; /* Lock for ->new_client_calls */
 	struct sockaddr_rxrpc	srx;		/* local address */
@@ -472,6 +473,7 @@ enum rxrpc_call_completion {
  * Bits in the connection flags.
  */
 enum rxrpc_conn_flag {
+	RXRPC_CONN_HAS_IDR,		/* Has a client conn ID assigned */
 	RXRPC_CONN_IN_SERVICE_CONNS,	/* Conn is in peer->service_conns */
 	RXRPC_CONN_DONT_REUSE,		/* Don't reuse this connection */
 	RXRPC_CONN_PROBING_FOR_UPGRADE,	/* Probing for service upgrade */
diff --git a/net/rxrpc/conn_client.c b/net/rxrpc/conn_client.c
index 48519f0de185..4c2db83fceae 100644
--- a/net/rxrpc/conn_client.c
+++ b/net/rxrpc/conn_client.c
@@ -40,12 +40,16 @@ static void rxrpc_activate_bundle(struct rxrpc_bundle *bundle)
 }
 
 /*
- * Release a connection ID for a client connection.
+ * Release a client connection ID exactly once.  The final reference may be
+ * dropped outside the local endpoint's I/O thread.
  */
 static void rxrpc_put_client_connection_id(struct rxrpc_local *local,
 					   struct rxrpc_connection *conn)
 {
-	idr_remove(&local->conn_ids, conn->proto.cid >> RXRPC_CIDSHIFT);
+	spin_lock(&local->conn_ids_lock);
+	if (test_and_clear_bit(RXRPC_CONN_HAS_IDR, &conn->flags))
+		idr_remove(&local->conn_ids, conn->proto.cid >> RXRPC_CIDSHIFT);
+	spin_unlock(&local->conn_ids_lock);
 }
 
 /*
@@ -56,6 +60,7 @@ static void rxrpc_destroy_client_conn_ids(struct rxrpc_local *local)
 	struct rxrpc_connection *conn;
 	int id;
 
+	spin_lock(&local->conn_ids_lock);
 	if (!idr_is_empty(&local->conn_ids)) {
 		idr_for_each_entry(&local->conn_ids, conn, id) {
 			pr_err("AF_RXRPC: Leaked client conn %p {%d}\n",
@@ -65,6 +70,7 @@ static void rxrpc_destroy_client_conn_ids(struct rxrpc_local *local)
 	}
 
 	idr_destroy(&local->conn_ids);
+	spin_unlock(&local->conn_ids_lock);
 }
 
 /*
@@ -162,15 +168,20 @@ rxrpc_alloc_client_connection(struct rxrpc_bundle *bundle)
 	if (!conn)
 		return ERR_PTR(-ENOMEM);
 
+	spin_lock(&local->conn_ids_lock);
 	id = idr_alloc_cyclic(&local->conn_ids, conn, 1, 0x40000000,
 			      GFP_ATOMIC | __GFP_NOWARN);
+	if (id >= 0) {
+		conn->proto.cid = id << RXRPC_CIDSHIFT;
+		set_bit(RXRPC_CONN_HAS_IDR, &conn->flags);
+	}
+	spin_unlock(&local->conn_ids_lock);
 	if (id < 0) {
 		kfree(conn);
 		return ERR_PTR(id);
 	}
 
 	refcount_set(&conn->ref, 1);
-	conn->proto.cid		= id << RXRPC_CIDSHIFT;
 	conn->proto.epoch	= local->rxnet->epoch;
 	conn->out_clientflag	= RXRPC_CLIENT_INITIATED;
 	conn->bundle		= rxrpc_get_bundle(bundle, rxrpc_bundle_get_client_conn);
diff --git a/net/rxrpc/conn_object.c b/net/rxrpc/conn_object.c
index 0ece717db0f8..bae95cadd72b 100644
--- a/net/rxrpc/conn_object.c
+++ b/net/rxrpc/conn_object.c
@@ -332,7 +332,8 @@ static void rxrpc_clean_up_connection(struct work_struct *work)
 	rxrpc_purge_queue(&conn->rx_queue);
 	rxrpc_free_skb(conn->tx_response, rxrpc_skb_put_response);
 
-	rxrpc_kill_client_conn(conn);
+	if (rxrpc_conn_is_client(conn))
+		rxrpc_kill_client_conn(conn);
 
 	conn->security->clear(conn);
 	key_put(conn->key);
diff --git a/net/rxrpc/local_object.c b/net/rxrpc/local_object.c
index 169f9dfdaa77..5a7acd595e11 100644
--- a/net/rxrpc/local_object.c
+++ b/net/rxrpc/local_object.c
@@ -140,6 +140,7 @@ static struct rxrpc_local *rxrpc_alloc_local(struct net *net,
 		memcpy(&local->srx, srx, sizeof(*srx));
 		local->srx.srx_service = 0;
 		idr_init(&local->conn_ids);
+		spin_lock_init(&local->conn_ids_lock);
 		get_random_bytes(&tmp, sizeof(tmp));
 		tmp &= 0x3fffffff;
 		if (tmp == 0)

base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
-- 
2.56.0
