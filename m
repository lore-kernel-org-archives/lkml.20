Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D61374D955C
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775035; cv=none; b=oexvXl4UeCa/NSzLMLuwuJN6E05/r1fr1/he90M8DpLAGK2AZ6lTXlXZnQ0ESjYtAuOxybTAqpwVPBceP1E/RvZ2C6WZX/FO+CATPjl83CMmiu19GeKzlYavNvYU1WDBCRhQ406tiq6Wi/YWDAIRW8n9iHh16kmM5B1cj0ZGtKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775035; c=relaxed/simple;
	bh=T9uCK0y8QAOBACI7VVq+gB3nzE5/ChdLbJbdFeCk5co=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FjtXF7JDREvn4jt13PgF1fOMdcWDm085yc+R1eqh7FvJWZeNVfnCoThdXBme7XWBUzQaAqNM4Y98V4CbyKEU+L5BDgasK7EysKX5QBINfGz1h5HFkSnC2D7GcdRylzgp+ejXK/0lo0ExwHQkIfMRV/14W5HSsD1xkR3lMNCInNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=uWlcZWkh; arc=none smtp.client-ip=74.125.228.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="uWlcZWkh"
Received: by mail-pz2-f39.google.com with SMTP id 41be03b00d2f7-cc78d59bb02so2063401a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1790775012; x=1791379812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xOljSjRffzsaoZkJhjEVtsEfoDUExcLQ0UCmRio28/0=;
        b=uWlcZWkhv4m0u85oW2Uk5ua1IVPqyADJyQ+R6eK2+0OPfyEOr/qqTVAYSEni850Wy9
         yrUsykvPpFH52zTgVWW9Enznm9aZDIvNc6nJq3tksl+MRvJ5TBfrM+jW1NlHPDvw0+mM
         UWpOeI/oC8DsMBNFRbejSal/hlJi7Gh5RDHmns1wA252XpktPfg6naF4gNP1Eaxp5IBm
         MYqR2V3bfXdDbwO/XNG3eKD2xYG9ZUg+wO+opUFXnVRGBXvDnlCFTNU0rsjkokED3bSD
         guEMvd9NaEHtFtXB0NOn9OY9ore+RQiY9dTSgCGwJjteinIWv4cfbuW8ovrykMklXS8r
         q2aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775012; x=1791379812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xOljSjRffzsaoZkJhjEVtsEfoDUExcLQ0UCmRio28/0=;
        b=h7WYH4OUB4aHiBfB5+NUTS7B+gylosCRAvBFbdUOrkHuKqroQl+1VT4+CERy95XzBd
         eL3ZCCF/0OhcwTo5gmWifKRCXIPu91EJHCIVfe8lG/LBn7/ELi7yDvJvUvb+ZO3JcW4s
         FPNLe3JNnYIlFlmGn8nE9NtB7lstU3YLJxbt9xL71fBtDRaSD3wU3W2Na0vlrVzTg3lg
         md2pKsWzXrwRgaqHPOeMgZrURiIJ8S852uFBZn3Ezl5nIXudCVTkn0B+bq00HNFbTSDS
         M55lEHbgAJf7j3NNEAESzH23T0a0umLLO2p0vPhVLFS9rkbLqMhS2aiMmq1E+TThPFIe
         /Akw==
X-Forwarded-Encrypted: i=1; AKwUvBxWJosFc0XokjvGyfqV5w3f13c9UzQcv2QKSYXo+uVSFslyxglKtfun8f0osdug0WJFr8uBprPpMPv0pZo=@vger.kernel.org
X-Gm-Message-State: AFuF++lMR62/gkOqjyTYhfQGNGGxhG2V/J+6BHIXWV8YaT4QctiKojI3
	9n+HKTxnbHzJBir+i/+XNzIApk3X3nX5rwQ6oDg+HnZwdGb8v1ZaKlJLHZhpsSv8lwqN
X-Gm-Gg: AYBFou3v4EzNkQxu2lZH2elnCM8HRDyXKjNidkpTOh/4THPRmamJJxne8xHjVVR/ILO
	hUTfTalYZ5JVWwFRI3DGwUMIxCD/XIPagycZdtEVA2SRvWJJCo4m5cXS8wMDmZolUgu6VEPV4ga
	/P+zKwuxBknZqfltSWmBWdznPzxTqatNcQRPB8HseXyDZhsltE34SHjgyG9MO8ckQa6dcKLkgOW
	/4/Hyrbk97YA8tfxIVLLzchRRYZhwaU04C8i6CuiLfsb+We6gIkKXwrvhZ5dcJzxsr06f+Kul0Z
	+30BoPog+W68Lu88tcp7+5LXVjEzItxhltOmnffFKGDQg75YKzEsSi9Ct89p04o0dVGy2y3vqiO
	gq/s86inanHv+8cVdrV8Al15VxR2NMiryqw61ZloN0Yr/Ws05A1XVD9SPYyYaBMsY2u2mevCj02
	J4bwym+Zf4aoqpNxP2MWjH9+1JBrE4iVk0uh8+rqx9aeso9kikDHgt4MV0zGIZsUm8lsCo7hcjE
	N//OegFwIbNIh6/tEVea9jeNpW5Yg==
X-Received: by 2002:a05:6a21:e90:b0:3de:5868:d3bd with SMTP id adf61e73a8af0-3de9e93ea82mr1527387637.58.1790775012165;
        Wed, 30 Sep 2026 06:30:12 -0700 (PDT)
Received: from 954df21a5119.. ([122.51.212.64])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7d9f1574esm913931a12.2.2026.09.30.06.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:30:11 -0700 (PDT)
From: Zihan Xi <zihanx@nebusec.ai>
To: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: zihanx@nebusec.ai,
	horms@kernel.org,
	kees@kernel.org,
	ernestas.k@iconn-networks.com,
	leitao@debian.org,
	tim.bird@sony.com,
	shuangpeng.kernel@gmail.com,
	luoxuanqiang@kylinos.cn,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Vega <vega@nebusec.ai>,
	Luxing Yin <root@tr0jan.top>
Subject: [PATCH net v13 2/2] llc: create listener children only for SABME
Date: Wed, 30 Sep 2026 13:29:42 +0000
Message-ID: <6d816ade8765b81d69d06af0d1970f3f09504a48.1790688018.git.zihanx@nebusec.ai>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790688018.git.zihanx@nebusec.ai>
References: <cover.1790688018.git.zihanx@nebusec.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The listener receive path should not allocate a passive-open child for
frames that cannot establish a connection. Create children only for SABME
commands, answer DISC and other P=1 commands with DM from the listener, and
drop other non-SABME frames.

Classify frames before backlog admission, and send deferred duplicate SABMEs
to the existing child. If that child is user-owned, defer the retransmission
on its backlog while holding the receive device. This prevents one peer
connection from creating multiple children and preserves SABME retry
handling.

Reject backlog packets without a valid LLC socket owner before dispatching
them to the state machine.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Reported-by: Vega <vega@nebusec.ai>
Assisted-by: LLM
Co-developed-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Luxing Yin <root@tr0jan.top>
Signed-off-by: Zihan Xi <zihanx@nebusec.ai>

---
changes in v13:
  - Keep listener SABME classification separate from child lifecycle
    handling, including duplicate-SABME delivery to an existing child.
  - Keep deferred listener SABMEs device-accounted until backlog drain.
  - Keep touched local declarations in reverse Xmas tree order and retain
    the v12 link.
  - v12 Link: https://lore.kernel.org/all/cover.1790255682.git.zihanx@nebusec.ai/
---
 include/net/llc_conn.h |   2 +-
 net/llc/llc_conn.c     | 131 ++++++++++++++++++++++++++++++++++++-----
 2 files changed, 117 insertions(+), 16 deletions(-)

diff --git a/include/net/llc_conn.h b/include/net/llc_conn.h
index 778e5e6c0..dc4828336 100644
--- a/include/net/llc_conn.h
+++ b/include/net/llc_conn.h
@@ -13,7 +13,7 @@
 
 #define LLC_EVENT                1
 #define LLC_PACKET               2
-#define LLC_LISTENER_FRAME       3
+#define LLC_LISTENER_SABME       3
 
 #define LLC_INCOMING_NONE        0
 #define LLC_INCOMING_PENDING     1
diff --git a/net/llc/llc_conn.c b/net/llc/llc_conn.c
index 349a7c5b9..79c29c57c 100644
--- a/net/llc/llc_conn.c
+++ b/net/llc/llc_conn.c
@@ -95,8 +95,8 @@ int llc_conn_state_process(struct sock *sk, struct sk_buff *skb)
 	case LLC_CONN_PRIM:
 		/*
 		 * Can't be sock_queue_rcv_skb, because we have to leave the
-		 * skb->sk pointing to the newly created struct sock in
-		 * llc_conn_handler. -acme
+		 * skb->sk pointing to the child socket created in
+		 * llc_conn_rcv_sabme(). -acme
 		 *
 		 * A connection indication belongs on the listener. If sk and
 		 * skb->sk are the same socket, queueing it would later make
@@ -801,7 +801,64 @@ static struct sock *llc_create_incoming_sock(struct sock *sk,
 	return newsk;
 }
 
-static int llc_conn_rcv_listener(struct sock *sk, struct sk_buff *skb,
+/* The listener is locked and bottom halves are disabled. */
+static int llc_conn_rcv_existing_sabme(struct sock *listener,
+				       struct sock *newsk,
+				       struct sk_buff *skb)
+{
+	struct llc_sock *llc = llc_sk(newsk);
+	int incoming_state;
+	int rc = 0;
+
+	bh_lock_sock_nested(newsk);
+	if (sock_owned_by_user(newsk)) {
+		if (!skb_set_owner_sk_safe(skb, newsk))
+			goto drop_unlock;
+		netdev_hold(skb->dev, NULL, GFP_ATOMIC);
+		llc_set_backlog_type(skb, LLC_PACKET);
+		if (sk_add_backlog(newsk, skb, READ_ONCE(newsk->sk_rcvbuf))) {
+			netdev_put(skb->dev, NULL);
+			goto drop_unlock;
+		}
+		goto unlock;
+	}
+
+	incoming_state = atomic_read(&llc->incoming_state);
+	if (READ_ONCE(llc->state) == LLC_CONN_OUT_OF_SVC) {
+		if (incoming_state == LLC_INCOMING_PENDING)
+			llc_release_incoming_sock(newsk);
+		goto drop_unlock;
+	}
+	if ((incoming_state == LLC_INCOMING_PENDING ||
+	     incoming_state == LLC_INCOMING_QUEUED) &&
+	    READ_ONCE(llc->incoming_listener) != listener)
+		goto drop_unlock;
+	if (incoming_state != LLC_INCOMING_NONE &&
+	    incoming_state != LLC_INCOMING_PENDING &&
+	    incoming_state != LLC_INCOMING_QUEUED)
+		goto drop_unlock;
+	if (!skb_set_owner_sk_safe(skb, newsk)) {
+		if (incoming_state == LLC_INCOMING_PENDING)
+			llc_release_incoming_sock(newsk);
+		goto drop_unlock;
+	}
+
+	rc = llc_conn_rcv(incoming_state == LLC_INCOMING_PENDING ? listener :
+			  newsk, skb);
+	if (incoming_state == LLC_INCOMING_PENDING &&
+	    atomic_read(&llc->incoming_state) == LLC_INCOMING_PENDING)
+		llc_release_incoming_sock(newsk);
+	goto unlock;
+
+drop_unlock:
+	kfree_skb(skb);
+unlock:
+	bh_unlock_sock(newsk);
+	sock_put(newsk);
+	return rc;
+}
+
+static int llc_conn_rcv_sabme(struct sock *sk, struct sk_buff *skb,
 			       struct llc_addr *saddr,
 			       struct llc_addr *daddr)
 {
@@ -812,8 +869,9 @@ static int llc_conn_rcv_listener(struct sock *sk, struct sk_buff *skb,
 	newsk = __llc_lookup_established(llc_sk(sk)->sap, saddr, daddr,
 					 dev_net(skb->dev));
 	if (newsk) {
-		sock_put(newsk);
-		goto drop;
+		rc = llc_conn_rcv_existing_sabme(sk, newsk, skb);
+		local_bh_enable();
+		return rc;
 	}
 	if (sk_acceptq_is_full(sk))
 		goto drop;
@@ -960,13 +1018,37 @@ void llc_release_incoming_children(struct sock *sk)
 	local_bh_enable();
 }
 
+/*
+ * This mirrors the ADM-state DM actions, but a listener has no peer
+ * address in llc->daddr yet.
+ */
+static void llc_conn_send_dm_rsp(struct llc_sap *sap, struct sk_buff *skb,
+				 struct llc_addr *saddr, u8 f_bit)
+{
+	struct sk_buff *nskb;
+	int rc;
+
+	nskb = llc_alloc_frame(NULL, skb->dev, LLC_PDU_TYPE_U, 0);
+	if (!nskb)
+		return;
+
+	llc_pdu_header_init(nskb, LLC_PDU_TYPE_U, sap->laddr.lsap,
+			    saddr->lsap, LLC_PDU_RSP);
+	llc_pdu_init_as_dm_rsp(nskb, f_bit);
+	rc = llc_mac_hdr_init(nskb, skb->dev->dev_addr, saddr->mac);
+	if (unlikely(rc))
+		kfree_skb(nskb);
+	else
+		dev_queue_xmit(nskb);
+}
+
 void llc_conn_handler(struct llc_sap *sap, struct sk_buff *skb)
 {
 	struct net_device *backlog_dev = NULL;
 	struct sock *newsk = NULL, *sk;
 	bool newsk_lookup_ref = false;
 	struct llc_addr saddr, daddr;
-	bool listener_frame = false;
+	bool listener_sabme = false;
 	bool newsk_locked = false;
 
 	llc_pdu_decode_sa(skb, saddr.mac);
@@ -1033,17 +1115,29 @@ void llc_conn_handler(struct llc_sap *sap, struct sk_buff *skb)
 	 * it needs to set several state variables (see, for instance,
 	 * llc_adm_actions_2 in net/llc/llc_c_st.c) and send a packet to
 	 * the originator of the new connection, and this state has to be
-	 * in the newly created struct sock private area. -acme
+	 * in the private area of the child created by
+	 * llc_conn_rcv_sabme(). -acme
 	 */
 	if (unlikely(sk->sk_state == TCP_LISTEN)) {
 		if (!newsk) {
+			if (llc_conn_ev_rx_sabme_cmd_pbit_set_x(sk, skb)) {
+				if (!llc_conn_ev_rx_disc_cmd_pbit_set_x(sk, skb)) {
+					u8 f_bit;
+
+					llc_pdu_decode_pf_bit(skb, &f_bit);
+					llc_conn_send_dm_rsp(sap, skb, &saddr, f_bit);
+				} else if (!llc_conn_ev_rx_xxx_cmd_pbit_set_1(sk, skb)) {
+					llc_conn_send_dm_rsp(sap, skb, &saddr, 1);
+				}
+				goto drop_unlock;
+			}
 			if (sock_owned_by_user(sk)) {
 				skb_orphan(skb);
-				llc_set_backlog_type(skb, LLC_LISTENER_FRAME);
-				listener_frame = true;
+				llc_set_backlog_type(skb, LLC_LISTENER_SABME);
+				listener_sabme = true;
 				goto enqueue;
 			}
-			llc_conn_rcv_listener(sk, skb, &saddr, &daddr);
+			llc_conn_rcv_sabme(sk, skb, &saddr, &daddr);
 			goto out;
 		}
 		if (!skb_set_owner_sk_safe(skb, newsk)) {
@@ -1074,7 +1168,7 @@ void llc_conn_handler(struct llc_sap *sap, struct sk_buff *skb)
 			llc_release_incoming_sock(newsk);
 	} else {
 		dprintk("%s: adding to backlog...\n", __func__);
-		if (!listener_frame)
+		if (!listener_sabme)
 			llc_set_backlog_type(skb, LLC_PACKET);
 		backlog_dev = skb->dev;
 		netdev_hold(backlog_dev, NULL, GFP_ATOMIC);
@@ -1138,7 +1232,7 @@ static int llc_backlog_rcv(struct sock *sk, struct sk_buff *skb)
 	int incoming_state;
 	int rc = 0;
 
-	if (llc_backlog_type(skb) == LLC_LISTENER_FRAME) {
+	if (llc_backlog_type(skb) == LLC_LISTENER_SABME) {
 		backlog_dev = skb->dev;
 		if (unlikely(child || sk->sk_state != TCP_LISTEN ||
 			     sock_flag(sk, SOCK_DEAD)))
@@ -1147,18 +1241,25 @@ static int llc_backlog_rcv(struct sock *sk, struct sk_buff *skb)
 		llc_pdu_decode_ssap(skb, &saddr.lsap);
 		llc_pdu_decode_da(skb, daddr.mac);
 		llc_pdu_decode_dsap(skb, &daddr.lsap);
-		rc = llc_conn_rcv_listener(sk, skb, &saddr, &daddr);
+		rc = llc_conn_rcv_sabme(sk, skb, &saddr, &daddr);
 		goto out;
 	} else if (likely(llc_backlog_type(skb) == LLC_PACKET)) {
 		backlog_dev = skb->dev;
-		if (child && child != sk) {
+		if (unlikely(!child))
+			goto drop;
+		if (child != sk) {
+			if (unlikely(child->sk_family != PF_LLC))
+				goto drop;
 			local_bh_disable();
 			bh_lock_sock_nested(child);
 			child_locked = true;
 		}
-		if (child && child != sk) {
+		if (child != sk) {
 			childllc = llc_sk(child);
 			incoming_state = atomic_read(&childllc->incoming_state);
+			if (incoming_state == LLC_INCOMING_NONE ||
+			    READ_ONCE(childllc->incoming_listener) != sk)
+				goto drop;
 
 			if (incoming_state == LLC_INCOMING_PENDING) {
 				if (sock_flag(sk, SOCK_DEAD) ||
-- 
2.43.0

