Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794344752;
	b=S9+N/k1/alhFa7gGaH0eGeMPJXRWbUgxY6n3mphGNvOaUpdyDiZi87C6mMjwxd5PqPP+
	 tXmATjfP2RwD3Nxl5fhEmuWaHrQWgQv/bLeRoSwvQ4hYq86z7eTZZJCla8SOMtTy8eM7D
	 KznvDZcD0mcxUqMS1k6lK38wqS71s7jTGQiihaJXzhxe8KamYhqAhNOjXy/A8xv+yskKJ
	 AT68fie4afMS/FM/5ldto9FDchyon4UmcD8PUQACk0BMOGagMq8qDTobLKt9/Kerfn1Zp
	 fabtV+epRSMgxCrB/Th0FhI7RUQkKWyWtQsawGtDRuQJxiPo6mlFyCF5fO5VrpV3yHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794344752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vVZVlJz2xvnsRRciHhmJHZpeRfn5b7Ccf+nD0x4TgnE=;
	b=UzqhH3bUz6EEp3mimG5fU/UyUmAQcWCscRt17KsoRpRkb/7W3cqmi022vJ+nd+8rAu9o
	 3gKVgDP8PDQ4eX9r4zTzRqzm//Y86+OcdO6pVmTY9g+SkDihj2ksGRxOvlDD1pETIJw/Y
	 dqQ2UW6j63cIlCBlQuuhikkYSBBM9sLoXoCf2tf7DhTjgiwNF2jQhiOnw7rNtxol/v2QH
	 PLCGXPZctfOdISRPwYNCH3nFJWOKfMmEslAhOdI2K1CJzN0U6Fn0SS2T4tHz/YK4ONyGP
	 n+6n+LBp6bofFesuKSe9seyyhWQDMAKWSg1sYQICQxI/1pQOGuPz8ZZedb1IPonE/8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b="PFKGTh/x";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B87160A382C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B87160A382C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=PFKGTh/x
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3acec6677so3870692c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1794344751; x=1794949551; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vVZVlJz2xvnsRRciHhmJHZpeRfn5b7Ccf+nD0x4TgnE=;
        b=PFKGTh/xcQl+W0yBVx+SaOfczow99hFdO6cJJoZJNuz6AXxmdoWFbZ3Y9pmgR3Fvzq
         oZaYe7Znzz5zqaXwBkNJyt9JoQDKbVb28mfc/D6mAHcvttw7pRl+Bu4g7rFzwE25OWb9
         dW267fUD7hXxaHrg7UewdnzTD8UxA8YRf6+9IdM7vSjWaZ1yJkNp7RAbRe3j41nAw/d3
         vCg5UHVxkLGk2ROIRaSAtvHhWcpg4huyFEW+Y2i+8TgBJ9TQhU9LXbTbymmxVhmgmLTc
         kwO6YFnVO755/P19vG4cBGk8AMltMylGgh5CeK/yic3SWZSbK8zRZmJi51AP0MfLhx/6
         JfmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794344751; x=1794949551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vVZVlJz2xvnsRRciHhmJHZpeRfn5b7Ccf+nD0x4TgnE=;
        b=WmV6QZUpXc3qTkbp8aHKgmZTNtux9sPotre2TaDTkpIUpOsOf9Sx2Lmn8Ivx8mfGbi
         uQkfexvPWrECIe8ZwXXuETurtLQ/hghtK/nIvzwPFykZc7CgctPTuC9eBsDvjVH9uJdT
         VGzZwzStjJLqIjYNiX1dv5YrItsN6blNDGPLmeDrBxo9zYx/JowTmD3LUHZP2sGgZk5o
         MkQFpb83BNMwG+72Pa/Q660NvA/yeNFuhy0FVCOmF8XwWGkB0dpFMMuxxYgSScXpW8RB
         K67gzbNJA+l2i+2Aw61HwHnujwGBJdeaw1PfQxiKsoxr7uOPq6MlYzMxEA9ewUzOvDet
         CqnA==
X-Forwarded-Encrypted: i=1; AL+hErGXvpZrVT0OuLRPvoRuBRl+fto35VYd+besF2C0cvyJx+0ifE9Lpt5EYSKe/cD+PwP2gCrRi9swGe9DBJs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9lLNQC/7ZihvAStRa9Y8/08KXQEAazaCdQUbDhzvfW0GxrA8yH
	7CCrXIdT3QuOIlGbvlhg2h20yG4+4y0G1tPeUOKNo1PuiQAfJKOpB5cmwEjM1SZg7V0=
X-Gm-Gg: AYBFou01ZJHsDMVaEouUDGgcWv90HGLFjJ+SPJBsibi46y83Vv9GRRlkCFRR7u5Odza
	YVJNSOgaFjMUyKe/LuGtwK/ZKjvLWNbrnU68KcBqAGhIx6x0tDogi5OxhbxVbLJm2eEtAnm7vz1
	Eb9Z55dtltu+1506oTS3TT936OYsp1kDgQBoCaX1FcV+HiWjFD8SMLRf9Sk2Nw2/tdxTtBkeAGr
	vJQzTfUERbf7Yl4+tQ7zevbUFLvXXOWI1bMOblsXHY5Epa7flXFWtt0Fcuu4bG6hyN6yBu3pxwH
	p1It+VpGoCes98WxJgcfiLi5muj32V8BfXJA4Nl0i39CNdQn1Jl/p9LsB3bZYeK3aX4NhOu9o6z
	kSLIPz07MvBt82gmhcLzHFsVVy2YZao1HsVs7dVuzk+kTV2/XTOampmazITQkGR0YXTgJcyEq7u
	ApodGkJDpNaN8OPxcSGP0uD1vdTEt5Jdt3S6BaYV6XdThyFjgMEl2lVyIz7u+wJGRPEo+MHWKdz
	iuql6ome1uUXlpBEWK5YX6rB6CRA+M4peNS1HeZFxRZjUyUbGMQS0vHdSNlVdiUsNCffqBvfWFw
	NZfNwA27NdsTZWZ6F9LDigPO303IcEmTJU/DGSKdWTrq4Yym8ZHdbSk1VPJuF6sms9GmFi0=
X-Received: by 2002:a05:7022:ed07:b0:188:ea93:6cf9 with SMTP id a92af1059eb24-1b3c0359347mr89087c88.43.1794344751021;
        Tue, 10 Nov 2026 13:05:51 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37520cfdfc6sm10464097eec.17.2026.11.10.13.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:05:50 -0800 (PST)
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
	linux-rt-devel@lists.linux.dev,
	Kuniyuki Iwashima <kuniyu@google.com>
Subject: [PATCH net v7 5/6] amt: make pre-query report drops visible
Date: Tue, 10 Nov 2026 21:05:36 +0000
Message-ID: <20261110210538.217936-6-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110210538.217936-1-omar@blockcast.net>
References: <20261110210538.217936-1-omar@blockcast.net>
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

A gateway cannot forward an IGMP or MLD report until it has received the
relay's Membership Query for that family.  The Query supplies the
response MAC the Update echoes, so dropping an early report is required,
but doing so silently leaves operators with a dark multicast path and no
indication why the join never happened.

Emit a family-specific debug message before taking the drop path.

tx_dropped could not show these drops either: amt_dev_xmit() reaches the
same tx_dropped increment after amt_send_membership_update() has handed
the report to the tunnel, so in gateway mode every forwarded report was
also counted as a drop. Return NETDEV_TX_OK directly once the report has
been sent, so a report the tunnel accepted is no longer counted in
tx_dropped.

The device is LLTX, so amt_dev_xmit() can run on several CPUs at once;
use DEV_STATS_INC() for tx_dropped and tx_errors, there and in the
control-message senders that update the same counters, so concurrent
increments are not lost.

Found by code inspection while debugging an IPv6-in-IPv6 forwarding
failure in a selftest for the AMT IPv6 outer transport. This drop can
leave one address family dark, so it was a suspect, but that was not
confirmed: the failure was later traced to the selftest, which sent a
single datagram without waiting for the relay's multicast routes to
converge. The drop has not been observed in production, and there is
no oops or trace. The Sashiko AI review of an earlier posting found the
tx_dropped miscount and the non-atomic counter updates.

Fixes: cbc21dc1cfe9 ("amt: add data plane of amt interface")
Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 42 +++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 99cce0a14..de5b7dbe3 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -735,7 +735,7 @@ static void amt_send_discovery(struct amt_dev *amt)
 				   IPPROTO_UDP, 0,
 				   amt->stream_dev->ifindex);
 	if (IS_ERR(rt)) {
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -745,7 +745,7 @@ static void amt_send_discovery(struct amt_dev *amt)
 	skb = netdev_alloc_skb_ip_align(amt->dev, len);
 	if (!skb) {
 		ip_rt_put(rt);
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -790,7 +790,7 @@ static void amt_send_discovery(struct amt_dev *amt)
 	ip_send_check(iph);
 	err = ip_local_out(amt->net, sk, skb);
 	if (unlikely(net_xmit_eval(err)))
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 
 	amt_update_gw_status(amt, AMT_STATUS_SENT_DISCOVERY, true);
 out:
@@ -826,7 +826,7 @@ static void amt_send_request(struct amt_dev *amt, bool v6)
 				   IPPROTO_UDP, 0,
 				   amt->stream_dev->ifindex);
 	if (IS_ERR(rt)) {
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -836,7 +836,7 @@ static void amt_send_request(struct amt_dev *amt, bool v6)
 	skb = netdev_alloc_skb_ip_align(amt->dev, len);
 	if (!skb) {
 		ip_rt_put(rt);
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -883,7 +883,7 @@ static void amt_send_request(struct amt_dev *amt, bool v6)
 	ip_send_check(iph);
 	err = ip_local_out(amt->net, sk, skb);
 	if (unlikely(net_xmit_eval(err)))
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 
 out:
 	rcu_read_unlock();
@@ -905,7 +905,7 @@ static void amt_send_igmp_gq(struct amt_dev *amt,
 
 	skb_pull(skb, sizeof(struct ethhdr));
 	if (amt_send_membership_query(amt, skb, tunnel, false)) {
-		amt->dev->stats.tx_dropped++;
+		DEV_STATS_INC(amt->dev, tx_dropped);
 		kfree_skb(skb);
 	}
 }
@@ -949,7 +949,7 @@ static struct sk_buff *amt_build_mld_gq(struct amt_dev *amt)
 
 	if (ipv6_dev_get_saddr(amt->net, amt->dev, &ip6h->daddr, 0,
 			       &ip6h->saddr)) {
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		kfree_skb(skb);
 		return NULL;
 	}
@@ -993,7 +993,7 @@ static void amt_send_mld_gq(struct amt_dev *amt, struct amt_tunnel_list *tunnel)
 
 	skb_pull(skb, sizeof(struct ethhdr));
 	if (amt_send_membership_query(amt, skb, tunnel, true)) {
-		amt->dev->stats.tx_dropped++;
+		DEV_STATS_INC(amt->dev, tx_dropped);
 		kfree_skb(skb);
 	}
 }
@@ -1353,7 +1353,7 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 		group.ip6 = ipv6_hdr(skb)->daddr;
 #endif
 	} else {
-		dev->stats.tx_errors++;
+		DEV_STATS_INC(dev, tx_errors);
 		goto free;
 	}
 
@@ -1366,12 +1366,21 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 		/* Gateway only passes IGMP/MLD packets */
 		if (!report)
 			goto free;
+		/* A validated report can only be forwarded after the relay's
+		 * family-specific Membership Query supplies the state echoed
+		 * by the Membership Update. Log this readiness failure before
+		 * the shared drop path accounts it.
+		 */
 		if ((!v6 && !READ_ONCE(amt->ready4)) ||
-		    (v6 && !READ_ONCE(amt->ready6)))
+		    (v6 && !READ_ONCE(amt->ready6))) {
+			netdev_dbg(dev, "drop %s report: waiting for Membership Query\n",
+				   v6 ? "MLD" : "IGMP");
 			goto free;
+		}
 		if (amt_send_membership_update(amt, skb,  v6))
 			goto free;
-		goto unlock;
+		/* Sent: the tunnel consumed the skb.  Not a drop. */
+		return NETDEV_TX_OK;
 	} else if (amt->mode == AMT_MODE_RELAY) {
 		if (!data)
 			goto free;
@@ -1400,8 +1409,7 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 	return NETDEV_TX_OK;
 free:
 	dev_kfree_skb(skb);
-unlock:
-	dev->stats.tx_dropped++;
+	DEV_STATS_INC(dev, tx_dropped);
 	return NETDEV_TX_OK;
 }
 
@@ -2777,7 +2785,7 @@ static void amt_send_advertisement(struct amt_dev *amt, __be32 nonce,
 				   IPPROTO_UDP, 0,
 				   amt->stream_dev->ifindex);
 	if (IS_ERR(rt)) {
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -2787,7 +2795,7 @@ static void amt_send_advertisement(struct amt_dev *amt, __be32 nonce,
 	skb = netdev_alloc_skb_ip_align(amt->dev, len);
 	if (!skb) {
 		ip_rt_put(rt);
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -2833,7 +2841,7 @@ static void amt_send_advertisement(struct amt_dev *amt, __be32 nonce,
 	ip_send_check(iph);
 	err = ip_local_out(amt->net, sk, skb);
 	if (unlikely(net_xmit_eval(err)))
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 
 out:
 	rcu_read_unlock();
-- 
2.43.0

