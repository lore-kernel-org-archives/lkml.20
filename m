Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794291744;
	b=E+L3lKaOaaONKZY5iyUeSOVzVkgKCcU7cBDs+sxL9Hug2kAm3AIgi6APKjGoJ/bdac0O
	 ZuFgpsWA2qREf1rpMQ4KC54WVPIYEQccdMTyK74M7xzCrbI1Ip5P8EuqN7t2bok2wyIcn
	 LyyJV56BNnXofApUoM0oPxbeYcf8Z98us2Om2rEGTwx9nkSzkuoFkrsTyODv5+Q5jdUSF
	 3Mu9X6hNgPOqMRsnTl6/xMXGur608FboLg7j9sW+MmOxuk4UvWiXdo6cMfiJbxayNPpF9
	 qPDEpeatxon3D97bxA0puOEiFTP6cilcGgx2XoZ+jAtSDE+VRsgRLyIP3vyVEE2QFaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794291744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cq+8LlRu4FfNVmN4rDDe1VjAuFHrpFWMROioS3TKhTw=;
	b=TTUCsCvk0M0M8Siz55qdZpPR8+GTQuzKQtZE2hB/uMebaLSMvMA7kJ4MkOUBBvNnpmax
	 Y+nXWhHNQY3wAkkqqh2C4cLV218msDnd/ftqAJi41qoizaioMLIWcN/dHFLOZ5tB5qNKS
	 1XROIpG3TE8IPtL9NH9X7wByS7EfI/y+ckaCbGcmVsEq9XyDUnwViDOTFMBM3CMry6ZIo
	 mM2X2l3vU2bVflA4LqySLSSoichthkTgiwx5Uok6FQK+WLCKxSKVmp8kz2HzCzOg+mBtb
	 hvxHGk2x63HEzwAsuF+EcF+8wx21so9FEaKTP47x7hRqSSz5xQhjHXDd+s0WlhMUyZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openai.com;
	spf=pass smtp.mailfrom=openai.com;
	dkim=pass header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=EIqzfx68;
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F9C606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 06:22:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82F9C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=openai.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openai.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=openai.com header.i=@openai.com header.a=rsa-sha256 header.s=google header.b=EIqzfx68
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-8446af403b5so949448a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 22:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openai.com; s=google; t=1794291743; x=1794896543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cq+8LlRu4FfNVmN4rDDe1VjAuFHrpFWMROioS3TKhTw=;
        b=EIqzfx68XkEAlGC1NtD8CjG3JQD4sDvo8EFlgKedv81XabH1G3rmMMqC4mt+MP8nBB
         5OV3KYpQSZWzGW+MXm79YcqzrFukHBiPQa13v/beXPmMP5PYusYJ14iPRB+xR/oKvMXv
         ujPXl3gPHKNhMFw3sFbe9v/p9iVmuNDn9plbQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794291743; x=1794896543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cq+8LlRu4FfNVmN4rDDe1VjAuFHrpFWMROioS3TKhTw=;
        b=MQM7zdhoeQgP/0ngSDxZGv1l5f+FtphKHendU1os1CSexg9QKlihWlxtyCjc7tplEc
         /A1mi0/W/6PVM1ISnN2BZ+F7K/XmDMWxDLJeQ3JUH2mx9SEWu+wMv+kuLBHN0axvtDF7
         2HNJ5xQAT5jsoA8CCHBz6JJbNM8e9Toj+7HrF8vhbL2PU0wnqaJykYcncRPQ0s3ZGOyC
         QU9OOVDMBGSWJ58TLCUEDSCnBeHrySCzJvmaDOVu3P6wzeWlXZnc+354/pYYEtMgMIMI
         lHdqTZuUzaxNuKqRogyH4uvRjCHlZhT3go3NX6Mg+mSSGvvGXRN84pjlEymDE1PlsjTf
         Js9Q==
X-Forwarded-Encrypted: i=1; AL+hErGStbbbOi2/TsjcA5mBy/+TzZcIlu8mJsRib4vqDyk65rp4aUq+B6dV+hBhbv+sxU5wVCEwjSDWw+K24yA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+6rtE1EFZQ69M8G55o9o1R1QxuNO4TwgE1FNnKCMYdJsGqF1CJ
	AHrNyW8shNdfczHuMkbT+y2ZIW/9Cm8TtzuJjgPv+XxYMjPr5ubTafGuzHJxd6IdPeU=
X-Gm-Gg: AYBFou3krjKrQ5pxroWWEg8aSQFStcsYrYyyU/WzKrafo7bNzdPBj/Me8QQtQ48fZzU
	HrPeLty66rig3xqMGhNEdH1LtMbLHq8xh7yDfET8QbJ9ojWGCGNYVy5J7qZNYSLqH11W61TOTl0
	Ir+vUsRajvmmPcR3GKj0LQ6cA7eZJ6x9CvnTb0kTBk6YBloy7eujMLgB8qG55kjCmTQGdQFmnlm
	vaGUzUaAiiOBrYy+23O8qq3GHdq8gnUfbebJ1KpIZinCq9m26gYXlR4Mz79eYZtZwkz/NjJwsdm
	sH2PP2QD+H8fgjRB29F9/ihe585uzIlrdq3ucGx6NkhidLbxiipaGjrBw+y3QE5CKWzL1YIrITZ
	0NdpX4mFuLtBapNVTMH+4cYo8b6m4uV2yYOulLPPVE8gC0KQuUz70tsE5oszzL5ipFHAI/qJWas
	AmyG0bWBNQ1DRLKaOqVPc0gdiZlMEnMNx1/b1qzeLVlycSV3q3TMCQxzgL994d9kMpGccwlyrrW
	MDiseGYI4pnRO4hTXnL7OGAWXUtb/eqMNgK0QxLqs6yprXEXGyP8W6jEhulAhy0RSTsbhP+S7O+
	R9loIiUJ35AKrXgoldYaS59BB1Ig6cU8hWE9yWY3lUrYn7GYTiBHUVYxuSBpfLOPs2H9ist85yJ
	hFB3f/d6fHOgdZwRrh06SpPQPtX79iw==
X-Received: by 2002:a05:6830:6810:b0:822:6f0d:d04d with SMTP id 46e09a7af769-860dc746fd3mr1126251a34.16.1794291743387;
        Mon, 09 Nov 2026 22:22:23 -0800 (PST)
Received: from com-75606.corp.openai.org ([199.47.143.1])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-860e5978892sm111726a34.12.2026.11.09.22.22.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 22:22:23 -0800 (PST)
From: Kyle Zeng <kylebot@openai.com>
To: linux-afs@lists.infradead.org
Cc: dhowells@redhat.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2] rxrpc: Serialize client connection IDR updates
Date: Mon,  9 Nov 2026 22:22:21 -0800
Message-ID: <20261110062221.96452-1-kylebot@openai.com>
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

Service connections use peer-selected CIDs and do not own client IDR
entries, but the common destructor removes those IDs. This can delete a
live client connection or race allocation and corrupt the IDR and its
RCU callbacks. Client destruction can also repeat an earlier removal
and delete a reused ID.

Restrict client cleanup to clients. Restore a per-local writer lock and
an ownership flag so each ID is released once. Release IDs at idle
retirement even if the bundle slot was replaced; otherwise deferred
final puts can leave the IDR nonempty at endpoint teardown and trigger
BUG(). Keeping IDs until retirement preserves active calls and terminal
retransmissions. Client-only cleanup also prevents nr_client_conns
underflow and restores the intended expiry selection without changing
the timeout values.

The issue was found by an LLM.

Fixes: 9d35d880e0e4 ("rxrpc: Move client call connection to the I/O thread")
Cc: stable@vger.kernel.org
Signed-off-by: Kyle Zeng <kylebot@openai.com>
---
v2:
  - Release a retired client connection's ID even if its bundle slot
    has been replaced. Keep the ID until retirement so active calls
    and terminal retransmissions remain reachable.
  - Describe the nr_client_conns accounting correction and its effect
    on normal-versus-fast expiry selection.
  - Repeat the RxRPC module and targeted x86 allmodconfig/allyesconfig
    W=1 builds. The reproducer was not rerun for v2.

v1: https://lore.kernel.org/r/20261030042129.73690-1-kylebot@openai.com
Review: https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261030042129.73690-1-kylebot%40openai.com

I have a reproducer for this issue and can share via DM

 net/rxrpc/ar-internal.h  |  2 ++
 net/rxrpc/conn_client.c  | 21 +++++++++++++++++----
 net/rxrpc/conn_object.c  |  3 ++-
 net/rxrpc/local_object.c |  1 +
 4 files changed, 22 insertions(+), 5 deletions(-)

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
index 48519f0de185..201a50caeaca 100644
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
@@ -682,6 +693,9 @@ static void rxrpc_unbundle_conn(struct rxrpc_connection *conn)
 	if (conn->flags & RXRPC_CONN_FINAL_ACK_MASK)
 		rxrpc_process_delayed_final_acks(conn, true);
 
+	/* A replaced connection is no longer in the bundle. */
+	rxrpc_put_client_connection_id(bundle->local, conn);
+
 	bindex = conn->bundle_shift / RXRPC_MAXCALLS;
 	if (bundle->conns[bindex] == conn) {
 		_debug("clear slot %u", bindex);
@@ -689,7 +703,6 @@ static void rxrpc_unbundle_conn(struct rxrpc_connection *conn)
 		bundle->conn_ids[bindex] = 0;
 		for (i = 0; i < RXRPC_MAXCALLS; i++)
 			clear_bit(conn->bundle_shift + i, &bundle->avail_chans);
-		rxrpc_put_client_connection_id(bundle->local, conn);
 		rxrpc_deactivate_bundle(bundle);
 		rxrpc_put_connection(conn, rxrpc_conn_put_unbundle);
 	}
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

base-commit: b3dfbde62cf1981c4638939c159dfd087b7a72e9
-- 
2.55.0.openai.911.g06873a30d2f3

