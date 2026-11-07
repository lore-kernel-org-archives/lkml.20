Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794012592;
	b=Ny7IgjFV1+R+ShMPlCUBYr6Ip4J9klaETsv1SN3zkXUVNyn0kpo3YmfTwEOziL8KGObn
	 A0sF4sy4l0XUjDCLDcJkZdfLfR80ApOXN4dXeGiWm2GmchRtg9TOFGrQ7rRXjzrlIj0IH
	 RJg2FRhSWBNA6qqWtIowGsG67xv+CavPap1c4C13k2/B424HWkPpUDkjNh9N11VXoY1fZ
	 kwuTQh3JwR6AS6rcqJPA5MYgahEUKZcN5/+KMMdOjHsI8qOV3Pd4grA1J+x3cHM+Ziri9
	 iK5bZCirdclRwipxCgAFeDfpaM0ZdfLqCBuQqgq0GOwT4e6IPr14c9Dywd8P08Ub1+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794012592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YNukWtG7bn8bZL+Vvj+eyPQrshYovQdP8P70UIwPWrs=;
	b=eTXfafp38pRto7zxARaWzgAPLTyFeEQS807rlULGkRPD7/TDg20Si+McTOguJd28IhUO
	 CR9wKUUNUqnI8TZSOOyKsw9X6fOMidg3oOW6CBApPIWqprJHL4u6CTKKSt5e+EsPwIJSL
	 A10fYBx3PnpN9ynVE8D0fz8mAOMbcoRjhAmPYM1R78dNP4v4idfgAwn5uD4QifxF8/Rb/
	 zJdx+co/RTxr0YVv4uygxBzAhGVPR62eBkaSTBXTf0IchLtJIrtegDayn63zOrqWle6cs
	 T3Ea8W2mgGTcfeFQkSgid04JblUuTgkxPY+wmtsuX937GW0BDDFQn77jNMuAAw9gMoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=nm9+1Ngu;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A107760733F0
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A107760733F0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=nm9+1Ngu
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so1953332eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1794012591; x=1794617391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YNukWtG7bn8bZL+Vvj+eyPQrshYovQdP8P70UIwPWrs=;
        b=nm9+1Ngu8FYm6Rtj91U7WZFPSL7dfq1sP+bfyKWWjp+RYZz+/Fi48stpszcYsoO1eY
         xiA0nZCg1aPvH772I1hU6ErxztNLJ2BdOvZBLOwFx/pclUNKoeWabSr0H1G4+OzGu/l6
         BONM6/xlurU8V62wWIcokttZJx/yTsFPwyOvdKJoQKUgyuwxhESrzKhCHlUtbWxWj45j
         dkDLSNvUFRk8ebl3hZG082kpfyrQlFVRHfTzeihuPPXVHOi3EbwYPFFEgdPFslNOHAiX
         Qqi61Lc5rF4brft8jG8dN+SR1yv5G7swv7M/oCFoKL3zsPi/yMnSJTRmBeOU22NxKBBO
         EWOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794012591; x=1794617391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YNukWtG7bn8bZL+Vvj+eyPQrshYovQdP8P70UIwPWrs=;
        b=E4AzSKVmKbWOfmJyAIZD3r2zYF2BRoH/KFNBf0IpqH+3pPvNbAsQakKsfS9x+7U1tg
         atgfl5l9fATtA7kAee71GQmrkQQNwd2wuLCoZKoDkr9Q8Bc8k+bTFGdqRYzNQP3lCbjk
         W4mGCYD8wJ1hJ+2a7w3jsgWX4tyvthaF986C8arShW5GnF3L8RDTzxQGAGwve36qToJT
         Sq48EoIgkC+spogxgLrMCI9d4sindZ3fYE36hONmr3GxNT/TGCvXPQY2LxN8FF2cmneB
         F/IUpFhB1bzOESCRelcdy1Pbrfnkv9/cRMtVLPrT12azdayr1igVFrlpl8Ie+JDxmDGo
         /aWw==
X-Forwarded-Encrypted: i=1; AL+hErFb5cmoHNgeBdWb+REOGK6b6xRkpArcYvihgz2yRjM+TsKvqxRWG+QDgYKAndzbw07NPxRSwCHtshfQOu8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FLf4ZO1dM6RJobu4CaTYE4auOK+IIDbB1hWCgt3rmVhdS2oGu
	rx83Rmo45ZtbhERX07ozxi+SvRc7f72NNA35ZUWVVMbOWLZ5+Gh/KXpJq4rMi0cCl+I=
X-Gm-Gg: AYBFou0HboNudH1eVjK6VC9kMo1luqhoD3xlPDLAfljL2SosoyIhDz75ogYEis9xEQZ
	562AeuUCZmtxEK1zLi0Ugt+CC3ur5jo25IypBGGylGvPEgKOOWjvnolwyqZ0D9uD9RqJ5dT+SSw
	zWo/W1IMVZU2E1fwgKfYqlTzx9opvDr/P3mMCeHJn9O32fq0yUdhQgvsMyFJbbTo8IStN9HpNH5
	nAzxocWBL84gpDYIERAIPkAq+MB8luSKdJ5BRe5+A2uuFIjbfXvnpHr9WwSxfFdhTt1M/rW0c+F
	COfkncFKjNtnZ1BWhlwShPodd52+sw6qoLwGmEID6tfwIwvOOIMAKivFf/1R3ZZlAyRJflE0ZK1
	qGgCgSdVCVXC6A08AsYDDOVKc97CM5dTG+hW4b4dKc6Bhqn5t59g4yMe1Ls+lJQlOn+fKReHtcT
	BLcTIht2AfygDGTKszvq+cwVvovjY827ZgnHnrhwLNNji5op55tkkTD4oaFMepMt9dVYaQ/inrm
	tNw97N2AWWv1pj6r+MbD2m7/r87I54F6hGHIbrG7lV92N1/mpf0VGfo5fQ1kkT59f53NW+iN+Ci
	t0V008w4QCWx5Ku7tCLTP4rR9bWrgivnC1oNZq5uM50vTXIAIU2YDSuSCZq+5OBE3578t2xmv/j
	+vLC9YXKiUCor2uTF
X-Received: by 2002:a05:7300:f14c:b0:36c:49a7:86ac with SMTP id 5a478bee46e88-36f783c0d66mr4856398eec.37.1794012590535;
        Fri, 06 Nov 2026 16:49:50 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a718sm11021294eec.4.2026.11.06.16.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:49:49 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-rt-devel@lists.linux.dev
Subject: [PATCH net v6 6/6] amt: create relay tunnels only from authenticated Updates
Date: Sat,  7 Nov 2026 00:49:35 +0000
Message-ID: <20261107004935.2627329-7-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261107004935.2627329-1-omar@blockcast.net>
References: <20261107004935.2627329-1-omar@blockcast.net>
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

An AMT Request has an unauthenticated, spoofable source address. Allocating
tunnel state from that path allowed spoofed Requests to consume tunnel
slots or overwrite the nonce and MAC of an established gateway.

Keep Requests stateless by deriving the Query MAC from the source
address, source port, nonce, and current secret, and retain four secret
generations so a gateway can renew its MAC across rotations.
Authenticate the Membership Update before decapsulation, and create or
refresh tunnel state only once ip_mc_check_igmp() or ipv6_mc_check_mld()
has accepted the encapsulated message. Key verified state by the
address/port endpoint, enforce global and per-source limits, and
silently reject an endpoint that cannot be admitted: withhold the Query
rather than send ICMP Host Unreachable to a source address nothing has
authenticated yet.

amt_update_tunnel() retries once when it finds its tunnel dead, and the
lookup skips dead tunnels, so an Update that races amt_tunnel_expire()
creates the replacement instead of being dropped. The Request path's
per-source count skips them too. Every tunnel is now created by an
Update, which stamps last_seen, so amt_tunnel_expire() no longer treats
a last_seen of 0 as never refreshed.

Every Membership Update, forged ones included, reads the secret
generations to check its MAC. Their writers hold amt->lock and update
them inside a seqcount, amt->key_seq. The Update path copies them in a
key_seq read loop, so reading them takes amt->lock only on PREEMPT_RT,
to wait for a writer.

Keying by address and port lets one address hold several tunnels; before
this patch the Request path looked tunnels up by address alone, so an
address normally held only one. AMT_MAX_TUNNELS_PER_SRC (16) bounds
that, so one address can fill at most an eighth of the default 128-slot
table while gateways behind NAT still get several tunnels. A
configurable limit needs new uAPI, so it is left for net-next.

Found by code inspection against RFC 7450; not triggered at runtime.

Fixes: cbc21dc1cfe9 ("amt: add data plane of amt interface")
Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 392 ++++++++++++++++++++++++++++++++--------------
 include/net/amt.h |  14 +-
 2 files changed, 281 insertions(+), 125 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index e430f38c4..ac496635e 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -672,14 +672,6 @@ static void __amt_update_relay_status(struct amt_tunnel_list *tunnel,
 	tunnel->status = status;
 }
 
-static void amt_update_relay_status(struct amt_tunnel_list *tunnel,
-				    enum amt_status status, bool validate)
-{
-	spin_lock_bh(&tunnel->lock);
-	__amt_update_relay_status(tunnel, status, validate);
-	spin_unlock_bh(&tunnel->lock);
-}
-
 static void amt_send_discovery(struct amt_dev *amt)
 {
 	struct amt_header_discovery *amtd;
@@ -863,11 +855,16 @@ static void amt_send_request(struct amt_dev *amt, bool v6)
 
 static bool amt_send_membership_query(struct amt_dev *amt,
 				      struct sk_buff *skb,
-				      struct amt_tunnel_list *tunnel,
+				      __be32 daddr, __be16 dport,
+				      __be32 nonce, u64 mac,
 				      bool v6);
 
-static void amt_send_igmp_gq(struct amt_dev *amt,
-			     struct amt_tunnel_list *tunnel)
+/* The destination is passed by value rather than as a tunnel: a Request is
+ * unauthenticated, so no tunnel state is created or changed for it - see
+ * amt_request_handler().
+ */
+static void amt_send_igmp_gq(struct amt_dev *amt, __be32 daddr, __be16 dport,
+			     __be32 nonce, u64 mac)
 {
 	struct sk_buff *skb;
 
@@ -876,7 +873,8 @@ static void amt_send_igmp_gq(struct amt_dev *amt,
 		return;
 
 	skb_pull(skb, sizeof(struct ethhdr));
-	if (amt_send_membership_query(amt, skb, tunnel, false)) {
+	if (amt_send_membership_query(amt, skb, daddr, dport, nonce, mac,
+				      false)) {
 		DEV_STATS_INC(amt->dev, tx_dropped);
 		kfree_skb(skb);
 	}
@@ -955,7 +953,8 @@ static struct sk_buff *amt_build_mld_gq(struct amt_dev *amt)
 	return skb;
 }
 
-static void amt_send_mld_gq(struct amt_dev *amt, struct amt_tunnel_list *tunnel)
+static void amt_send_mld_gq(struct amt_dev *amt, __be32 daddr, __be16 dport,
+			    __be32 nonce, u64 mac)
 {
 	struct sk_buff *skb;
 
@@ -964,13 +963,15 @@ static void amt_send_mld_gq(struct amt_dev *amt, struct amt_tunnel_list *tunnel)
 		return;
 
 	skb_pull(skb, sizeof(struct ethhdr));
-	if (amt_send_membership_query(amt, skb, tunnel, true)) {
+	if (amt_send_membership_query(amt, skb, daddr, dport, nonce, mac,
+				      true)) {
 		DEV_STATS_INC(amt->dev, tx_dropped);
 		kfree_skb(skb);
 	}
 }
 #else
-static void amt_send_mld_gq(struct amt_dev *amt, struct amt_tunnel_list *tunnel)
+static void amt_send_mld_gq(struct amt_dev *amt, __be32 daddr, __be16 dport,
+			    __be32 nonce, u64 mac)
 {
 }
 #endif
@@ -1004,7 +1005,16 @@ static void amt_secret_work(struct work_struct *work)
 					   secret_wq);
 
 	spin_lock_bh(&amt->lock);
-	get_random_bytes(&amt->key, sizeof(siphash_key_t));
+	write_seqcount_begin(&amt->key_seq);
+	/* Keep three previous generations for a 180-240s MAC lifetime.
+	 * Its 180s floor exceeds the advertised QQIC (amt->qi, 125s),
+	 * allowing the gateway to renew its MAC with a periodic Request.
+	 */
+	amt->key[3] = amt->key[2];
+	amt->key[2] = amt->key[1];
+	amt->key[1] = amt->key[0];
+	get_random_bytes(&amt->key[0], sizeof(siphash_key_t));
+	write_seqcount_end(&amt->key_seq);
 	spin_unlock_bh(&amt->lock);
 	mod_delayed_work(amt_wq, &amt->secret_wq,
 			 msecs_to_jiffies(AMT_SECRET_TIMEOUT));
@@ -1204,9 +1214,16 @@ static void amt_send_multicast_data(struct amt_dev *amt,
 			    0);
 }
 
+/* Send a Membership Query in reply to an unauthenticated Request.
+ *
+ * No per-source state is read or created: the gateway echoes the nonce and
+ * the keyed MAC in its Membership Update, where the MAC is recomputed, so
+ * everything this needs is passed by value.
+ */
 static bool amt_send_membership_query(struct amt_dev *amt,
 				      struct sk_buff *skb,
-				      struct amt_tunnel_list *tunnel,
+				      __be32 daddr, __be16 dport,
+				      __be32 nonce, u64 mac,
 				      bool v6)
 {
 	struct amt_header_membership_query *amtmq;
@@ -1227,13 +1244,13 @@ static bool amt_send_membership_query(struct amt_dev *amt,
 	skb_reset_inner_headers(skb);
 	memset(&fl4, 0, sizeof(struct flowi4));
 	fl4.flowi4_oif         = amt->stream_dev->ifindex;
-	fl4.daddr              = tunnel->ip4;
+	fl4.daddr              = daddr;
 	fl4.saddr              = amt->local_ip;
 	fl4.flowi4_dscp        = inet_dsfield_to_dscp(AMT_TOS);
 	fl4.flowi4_proto       = IPPROTO_UDP;
 	rt = ip_route_output_key(amt->net, &fl4);
 	if (IS_ERR(rt)) {
-		netdev_dbg(amt->dev, "no route to %pI4\n", &tunnel->ip4);
+		netdev_dbg(amt->dev, "no route to %pI4\n", &daddr);
 		return true;
 	}
 
@@ -1243,8 +1260,8 @@ static bool amt_send_membership_query(struct amt_dev *amt,
 	amtmq->reserved = 0;
 	amtmq->l	= 0;
 	amtmq->g	= 0;
-	amtmq->nonce	= tunnel->nonce;
-	amtmq->response_mac = tunnel->mac;
+	amtmq->nonce	= nonce;
+	amtmq->response_mac = mac;
 
 	if (!v6)
 		skb_set_inner_protocol(skb, htons(ETH_P_IP));
@@ -1257,11 +1274,10 @@ static bool amt_send_membership_query(struct amt_dev *amt,
 			    ip4_dst_hoplimit(&rt->dst),
 			    0,
 			    amt->relay_port,
-			    tunnel->source_port,
+			    dport,
 			    false,
 			    false,
 			    0);
-	amt_update_relay_status(tunnel, AMT_STATUS_SENT_QUERY, true);
 	return false;
 }
 
@@ -1449,12 +1465,7 @@ static void amt_tunnel_expire(struct work_struct *work)
 	 * or finds it dead.
 	 */
 	now = jiffies;
-	deadline = tunnel->last_seen;
-	/* No Update yet: the Request armed gc_wq for one GMI. */
-	if (!deadline)
-		deadline = now;
-	else
-		deadline += msecs_to_jiffies(amt_gmi(amt)) * 3;
+	deadline = tunnel->last_seen + msecs_to_jiffies(amt_gmi(amt)) * 3;
 	if (time_before(now, deadline)) {
 		mod_delayed_work(amt_wq, &tunnel->gc_wq, deadline - now);
 		spin_unlock_bh(&tunnel->lock);
@@ -2603,16 +2614,152 @@ static bool amt_membership_query_handler(struct amt_dev *amt,
 	return false;
 }
 
+/* The live tunnel of the gateway endpoint @saddr:@sport, or NULL.  Dead
+ * tunnels are skipped, so the retry in amt_update_tunnel() after losing a
+ * race with amt_tunnel_expire() creates the replacement.
+ */
+static struct amt_tunnel_list *amt_tunnel_lookup(struct amt_dev *amt,
+						 __be32 saddr, __be16 sport)
+{
+	struct amt_tunnel_list *tunnel;
+
+	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list) {
+		if (tunnel->ip4 == saddr && tunnel->source_port == sport &&
+		    !READ_ONCE(tunnel->dead))
+			return tunnel;
+	}
+	return NULL;
+}
+
+/* Look up the tunnel for a source whose Membership Update has already been
+ * authenticated, creating it on first contact.
+ *
+ * This is the only place tunnel state is allocated, so amt->max_tunnels
+ * bounds the number of *verified* gateways rather than the number of
+ * unverified Requests anyone can send.  A fixed per-source cap additionally
+ * limits one verified source address to AMT_MAX_TUNNELS_PER_SRC tunnels.
+ */
+static struct amt_tunnel_list *amt_tunnel_get_or_create(struct amt_dev *amt,
+							__be32 saddr,
+							__be16 sport)
+{
+	struct amt_tunnel_list *tunnel;
+	int per_src = 0;
+	int i;
+
+	tunnel = amt_tunnel_lookup(amt, saddr, sport);
+	if (tunnel)
+		return tunnel;
+
+	spin_lock_bh(&amt->lock);
+
+	/* Re-check under the lock in case a concurrent Update won the race, and
+	 * count how many tunnels this source already holds on the same walk.
+	 */
+	list_for_each_entry(tunnel, &amt->tunnel_list, list) {
+		if (tunnel->ip4 != saddr)
+			continue;
+		if (tunnel->source_port == sport) {
+			spin_unlock_bh(&amt->lock);
+			return tunnel;
+		}
+		per_src++;
+	}
+
+	if (amt->nr_tunnels >= amt->max_tunnels ||
+	    per_src >= AMT_MAX_TUNNELS_PER_SRC) {
+		spin_unlock_bh(&amt->lock);
+		return NULL;
+	}
+
+	if (!netif_running(amt->dev)) {
+		spin_unlock_bh(&amt->lock);
+		return NULL;
+	}
+
+	tunnel = kzalloc(sizeof(*tunnel) +
+			 (sizeof(struct hlist_head) * amt->hash_buckets),
+			 GFP_ATOMIC);
+	if (!tunnel) {
+		spin_unlock_bh(&amt->lock);
+		return NULL;
+	}
+
+	tunnel->source_port = sport;
+	tunnel->ip4 = saddr;
+	tunnel->amt = amt;
+	spin_lock_init(&tunnel->lock);
+	for (i = 0; i < amt->hash_buckets; i++)
+		INIT_HLIST_HEAD(&tunnel->groups[i]);
+
+	tunnel->last_seen = jiffies;
+	INIT_DELAYED_WORK(&tunnel->gc_wq, amt_tunnel_expire);
+	__amt_update_relay_status(tunnel, AMT_STATUS_RECEIVED_UPDATE, false);
+
+	/* Publish only once the entry is fully initialised. */
+	list_add_tail_rcu(&tunnel->list, &amt->tunnel_list);
+	amt->nr_tunnels++;
+	mod_delayed_work(amt_wq, &tunnel->gc_wq,
+			 msecs_to_jiffies(amt_gmi(amt)) * 3);
+	spin_unlock_bh(&amt->lock);
+
+	return tunnel;
+}
+
+/* Apply a valid, authenticated Membership Update to the tunnel of its
+ * endpoint, creating the tunnel on first contact.  Returns false if the
+ * Update is dropped.
+ *
+ * amt_tunnel_expire() reads last_seen and sets dead under tunnel->lock, so
+ * the refresh below either keeps the tunnel alive or finds it dead.  A
+ * tunnel that expired between the lookup and the lock is skipped by the
+ * second amt_tunnel_get_or_create() call, which creates its replacement.
+ */
+static bool amt_update_tunnel(struct amt_dev *amt, struct sk_buff *skb,
+			      __be32 saddr, __be16 sport, bool v6)
+{
+	struct amt_tunnel_list *tunnel;
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		tunnel = amt_tunnel_get_or_create(amt, saddr, sport);
+		if (!tunnel)
+			return false;
+
+		spin_lock_bh(&tunnel->lock);
+		if (!READ_ONCE(tunnel->dead)) {
+			/* gc_wq is re-armed by amt_tunnel_expire() itself
+			 * from last_seen, never from here, so this cannot
+			 * re-queue the work of a tunnel that is being freed.
+			 */
+			tunnel->last_seen = jiffies;
+#if IS_ENABLED(CONFIG_IPV6)
+			if (v6)
+				amt_mld_report_handler(amt, skb, tunnel);
+			else
+#endif
+				amt_igmp_report_handler(amt, skb, tunnel);
+			spin_unlock_bh(&tunnel->lock);
+			return true;
+		}
+		spin_unlock_bh(&tunnel->lock);
+	}
+	return false;
+}
+
 static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 {
 	struct amt_header_membership_update *amtmu;
-	struct amt_tunnel_list *tunnel;
+	bool verified = false;
+	siphash_key_t key[4];
+	int len, hdr_size, i;
 	struct ethhdr *eth;
 	struct iphdr *iph;
-	int len, hdr_size;
+	unsigned int seq;
 	u64 response_mac;
 	__be32 saddr;
 	__be32 nonce;
+	__be16 sport;
 
 	saddr = ip_hdr(skb)->saddr;
 
@@ -2626,27 +2773,45 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 
 	nonce = amtmu->nonce;
 	response_mac = amtmu->response_mac;
+	/* Snapshot the tunnel endpoint port before the encap is stripped. */
+	sport = udp_hdr(skb)->source;
+
+	/* Recompute the MAC handed out in the Membership Query.  Four live
+	 * secrets cover 180-240s, exceeding the advertised QQIC (amt->qi,
+	 * 125s), so a periodic Request can renew the MAC before it expires.
+	 * Authenticate before decapsulation or allocating tunnel state.
+	 */
+	do {
+		seq = read_seqcount_begin(&amt->key_seq);
+		for (i = 0; i < ARRAY_SIZE(key); i++)
+			key[i] = amt->key[i];
+	} while (read_seqcount_retry(&amt->key_seq, seq));
+
+	for (i = 0; i < ARRAY_SIZE(key); i++) {
+		u64 mac = siphash_3u32((__force u32)saddr,
+				       (__force u32)sport,
+				       (__force u32)nonce,
+				       &key[i]) >> 16;
+
+		if (response_mac == mac) {
+			verified = true;
+			break;
+		}
+	}
+
+	if (!verified) {
+		netdev_dbg(amt->dev, "Invalid MAC\n");
+		return true;
+	}
 
+	/* Create or refresh a tunnel only once the encapsulated message has
+	 * passed ip_mc_check_igmp() or ipv6_mc_check_mld().
+	 */
 	if (iptunnel_pull_header(skb, hdr_size, skb->protocol, false))
 		return true;
 
 	skb_reset_network_header(skb);
 
-	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list) {
-		if (tunnel->ip4 == saddr) {
-			if ((nonce == tunnel->nonce &&
-			     response_mac == tunnel->mac)) {
-				goto report;
-			} else {
-				netdev_dbg(amt->dev, "Invalid MAC\n");
-				return true;
-			}
-		}
-	}
-
-	return true;
-
-report:
 	if (!pskb_may_pull(skb, sizeof(*iph)))
 		return true;
 
@@ -2660,21 +2825,8 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 			return true;
 		}
 
-		spin_lock_bh(&tunnel->lock);
-		if (READ_ONCE(tunnel->dead)) {
-			spin_unlock_bh(&tunnel->lock);
+		if (!amt_update_tunnel(amt, skb, saddr, sport, false))
 			return true;
-		}
-		/* Refresh liveness under tunnel->lock, where
-		 * amt_tunnel_expire() reads it; 0 is kept for a tunnel no
-		 * Update has refreshed.  gc_wq is re-armed by
-		 * amt_tunnel_expire() itself from last_seen, never from
-		 * here, so this cannot re-queue the work of a tunnel that is
-		 * being freed.
-		 */
-		tunnel->last_seen = jiffies ?: 1;
-		amt_igmp_report_handler(amt, skb, tunnel);
-		spin_unlock_bh(&tunnel->lock);
 
 		skb_push(skb, sizeof(struct ethhdr));
 		skb_reset_mac_header(skb);
@@ -2692,14 +2844,8 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 			return true;
 		}
 
-		spin_lock_bh(&tunnel->lock);
-		if (READ_ONCE(tunnel->dead)) {
-			spin_unlock_bh(&tunnel->lock);
+		if (!amt_update_tunnel(amt, skb, saddr, sport, true))
 			return true;
-		}
-		tunnel->last_seen = jiffies ?: 1;
-		amt_mld_report_handler(amt, skb, tunnel);
-		spin_unlock_bh(&tunnel->lock);
 
 		skb_push(skb, sizeof(struct ethhdr));
 		skb_reset_mac_header(skb);
@@ -2718,13 +2864,10 @@ static bool amt_update_handler(struct amt_dev *amt, struct sk_buff *skb)
 	skb->pkt_type = PACKET_MULTICAST;
 	skb->ip_summed = CHECKSUM_NONE;
 	len = skb->len;
-	if (__netif_rx(skb) == NET_RX_SUCCESS) {
-		amt_update_relay_status(tunnel, AMT_STATUS_RECEIVED_UPDATE,
-					true);
+	if (__netif_rx(skb) == NET_RX_SUCCESS)
 		dev_sw_netstats_rx_add(amt->dev, len);
-	} else {
+	else
 		amt->dev->stats.rx_dropped++;
-	}
 
 	return false;
 }
@@ -2840,15 +2983,30 @@ static bool amt_discovery_handler(struct amt_dev *amt, struct sk_buff *skb)
 	return false;
 }
 
+/* Handle an AMT Request.
+ *
+ * The source of a Request is unauthenticated: it is a bare UDP datagram with a
+ * trivially spoofable source address.  Allocating tunnel state here would let
+ * an attacker fill the table from spoofed addresses, or let one spoofed packet
+ * overwrite the nonce/MAC of an established tunnel and cut that gateway off.
+ *
+ * Nothing needs to be remembered at this point.  Every input to the keyed MAC
+ * is carried in the packet or is device state, so the MAC is generated here,
+ * echoed back by the gateway in its Membership Update, and recomputed and
+ * verified there - see amt_update_handler().  Tunnel state is created only once
+ * that verification succeeds and the encapsulated message passes its IGMP or
+ * MLD check.
+ */
 static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
 {
 	struct amt_header_request *amtrh;
 	struct amt_tunnel_list *tunnel;
-	unsigned long long key;
+	bool full, have = false;
 	struct udphdr *udph;
 	struct iphdr *iph;
+	siphash_key_t key;
+	int per_src = 0;
 	u64 mac;
-	int i;
 
 	if (!pskb_may_pull(skb, sizeof(*udph) + sizeof(*amtrh)))
 		return true;
@@ -2860,59 +3018,45 @@ static bool amt_request_handler(struct amt_dev *amt, struct sk_buff *skb)
 	if (amtrh->reserved1 || amtrh->reserved2 || amtrh->version)
 		return true;
 
-	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list)
-		if (tunnel->ip4 == iph->saddr)
-			goto send;
-
-	spin_lock_bh(&amt->lock);
-	if (amt->nr_tunnels >= amt->max_tunnels) {
-		spin_unlock_bh(&amt->lock);
-		icmp_ndo_send(skb, ICMP_DEST_UNREACH, ICMP_HOST_UNREACH, 0);
-		return true;
-	}
-
-	tunnel = kzalloc(sizeof(*tunnel) +
-			 (sizeof(struct hlist_head) * amt->hash_buckets),
-			 GFP_ATOMIC);
-	if (!tunnel) {
-		spin_unlock_bh(&amt->lock);
+	if (!netif_running(amt->dev) || !netif_running(amt->stream_dev))
 		return true;
-	}
 
-	tunnel->source_port = udph->source;
-	tunnel->ip4 = iph->saddr;
-
-	memcpy(&key, &tunnel->key, sizeof(unsigned long long));
-	tunnel->amt = amt;
-	spin_lock_init(&tunnel->lock);
-	for (i = 0; i < amt->hash_buckets; i++)
-		INIT_HLIST_HEAD(&tunnel->groups[i]);
-
-	INIT_DELAYED_WORK(&tunnel->gc_wq, amt_tunnel_expire);
-
-	list_add_tail_rcu(&tunnel->list, &amt->tunnel_list);
-	tunnel->key = amt->key;
-	__amt_update_relay_status(tunnel, AMT_STATUS_RECEIVED_REQUEST, true);
-	amt->nr_tunnels++;
-	mod_delayed_work(amt_wq, &tunnel->gc_wq,
-			 msecs_to_jiffies(amt_gmi(amt)));
+	/* Snapshot the secret and the table-full state under the lock and walk
+	 * the endpoints outside it, so a Request holds amt->lock only for this
+	 * O(1) snapshot.
+	 */
+	spin_lock_bh(&amt->lock);
+	key = amt->key[0];
+	full = amt->nr_tunnels >= amt->max_tunnels;
 	spin_unlock_bh(&amt->lock);
 
-send:
-	tunnel->nonce = amtrh->nonce;
-	mac = siphash_3u32((__force u32)tunnel->ip4,
-			   (__force u32)tunnel->source_port,
-			   (__force u32)tunnel->nonce,
-			   &tunnel->key);
-	tunnel->mac = mac >> 16;
+	/* Skip dead tunnels, as amt_tunnel_lookup() does: each is already
+	 * being torn down, so it must not count against a new endpoint.
+	 */
+	rcu_read_lock();
+	list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list) {
+		if (tunnel->ip4 != iph->saddr || READ_ONCE(tunnel->dead))
+			continue;
+		per_src++;
+		if (tunnel->source_port == udph->source)
+			have = true;
+	}
+	rcu_read_unlock();
 
-	if (!netif_running(amt->dev) || !netif_running(amt->stream_dev))
+	/* Withhold the Query when a new endpoint cannot get a tunnel. */
+	if (!have && (full || per_src >= AMT_MAX_TUNNELS_PER_SRC))
 		return true;
 
+	mac = siphash_3u32((__force u32)iph->saddr,
+			   (__force u32)udph->source,
+			   (__force u32)amtrh->nonce,
+			   &key) >> 16;
 	if (!amtrh->p)
-		amt_send_igmp_gq(amt, tunnel);
+		amt_send_igmp_gq(amt, iph->saddr, udph->source, amtrh->nonce,
+				 mac);
 	else
-		amt_send_mld_gq(amt, tunnel);
+		amt_send_mld_gq(amt, iph->saddr, udph->source, amtrh->nonce,
+				mac);
 
 	return false;
 }
@@ -3180,6 +3324,16 @@ static int amt_dev_open(struct net_device *dev)
 	enable_delayed_work(&amt->discovery_wq);
 	enable_delayed_work(&amt->req_wq);
 
+	/* Seed the keys before amt_socket_create() enables the encap receive
+	 * path, so no Query MAC is generated, and no Update verified, with an
+	 * all-zero (predictable) secret.
+	 */
+	spin_lock_bh(&amt->lock);
+	write_seqcount_begin(&amt->key_seq);
+	get_random_bytes(&amt->key, sizeof(amt->key));
+	write_seqcount_end(&amt->key_seq);
+	spin_unlock_bh(&amt->lock);
+
 	err = amt_socket_create(amt);
 	if (err) {
 		disable_delayed_work(&amt->req_wq);
@@ -3190,7 +3344,6 @@ static int amt_dev_open(struct net_device *dev)
 	amt->req_cnt = 0;
 	WRITE_ONCE(amt->remote_ip, 0);
 	amt->nonce = 0;
-	get_random_bytes(&amt->key, sizeof(siphash_key_t));
 
 	amt->status = AMT_STATUS_INIT;
 	if (amt->mode == AMT_MODE_GATEWAY) {
@@ -3408,6 +3561,7 @@ static int amt_newlink(struct net_device *dev,
 		amt->max_tunnels = AMT_MAX_TUNNELS;
 
 	spin_lock_init(&amt->lock);
+	seqcount_spinlock_init(&amt->key_seq, &amt->lock);
 	amt->max_groups = AMT_MAX_GROUP;
 	amt->max_sources = AMT_MAX_SOURCE;
 	amt->hash_buckets = AMT_HSIZE;
diff --git a/include/net/amt.h b/include/net/amt.h
index 568565793..f0fc0903f 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -253,10 +253,6 @@ struct amt_tunnel_list {
 	bool			dead;
 	__be16			source_port;
 	__be32			ip4;
-	__be32			nonce;
-	siphash_key_t		key;
-	u64			mac:48,
-				reserved:16;
 	struct rcu_head		rcu;
 	struct hlist_head	groups[];
 };
@@ -342,8 +338,12 @@ struct amt_dev {
 	struct work_struct	event_wq;
 	/* AMT status */
 	enum amt_status		status;
-	/* Generated key */
-	siphash_key_t		key;
+	/* Current key and three previous generations keep MACs valid for
+	 * 180-240s, beyond the advertised QQIC (see amt_secret_work()).
+	 */
+	siphash_key_t		key[4];
+	/* For lockless readers of key; writers hold lock */
+	seqcount_spinlock_t	key_seq;
 	struct sock	  __rcu *sk;
 	u32			max_groups;
 	u32			max_sources;
@@ -400,6 +400,8 @@ struct amt_dev {
 #define AMT_SECRET_TIMEOUT	60000
 #define IANA_AMT_UDP_PORT	2268
 #define AMT_MAX_TUNNELS         128
+/* Most tunnels one verified source address may hold. */
+#define AMT_MAX_TUNNELS_PER_SRC 16
 #define AMT_MAX_REQS		128
 #define AMT_GW_HLEN (sizeof(struct iphdr) + \
 		     sizeof(struct udphdr) + \
-- 
2.43.0

