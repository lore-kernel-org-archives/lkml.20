Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A340925B085
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 00:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791419777; cv=none; b=ZZgY6DS0J1H7k2OJhRmv50A+0nx7e20NsS3IZh03sxKx3hAdRAgBdhe93HzHS7WIRqJxQlMh7PziIpMdtxT+bwGPyLpotkvP0iAc2DOf+7XW8ZhY3NRtsBYa4uuQbMGlYfLFRC308WNan2nEna/KRyvZZxflsI7QSLKQd7c9S1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791419777; c=relaxed/simple;
	bh=Iwn8OCqDci48vs+PcB/j+jaaRjSYuL8d5SgF0XwTaXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ljXN9zfg7Ngorjs2hBkxc2lx0gUPiOOp7UDQUiWZwrFzm9OQjtpQlB1N7ScxbkLt6oDYKnjLnOQQ/kjgCvm4NwxQz8eHO1gO6jIPkLoefqXrvbybr4+4eRpeN8ZKL9BwetYTv1/JprIvJ7ZvBoS1ekRf0Syz9SrwMEBmS/VbEvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=ksYZqi16; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="ksYZqi16"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33c2520ad38so5713213eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 17:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1791419773; x=1792024573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3xb0HRq3F2RQ+87GPpNOlAw+/L0DXNvdTRKXnpuxSkY=;
        b=ksYZqi16hcV3/+8t+lobkinA59l3uYZEewCFLpR4SI7y6gSV2lRi+F72Moc7nyBifi
         29kAbCaY/RTgoPmgm/1VawR2ynWnEvYrdu5rUJrUmK7JnrPV817KDfvRvX+L/nzGRSHr
         OL0FLaxM0uDPDVMhb3fmgpVwfDQkl23XSmh0H14xwUsN5bq/FMVj0wGP0gJRYD3LdtFP
         S2Y32VF7iL0RfXz7bHwRusH2nL72BkNftc1fe5CpmvAgd3ujS4EkqArsYMOTJmpr6OUR
         +u12DM1LQi82qYQwv/booxX+VBbgZIQJgbpgGy/f7Sawd0Mn4ewBUwoEDb65jtICXhOc
         IjXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791419773; x=1792024573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3xb0HRq3F2RQ+87GPpNOlAw+/L0DXNvdTRKXnpuxSkY=;
        b=UeWUb0YFjNAfgXzqYWqbZ8nCbdZrRHA9Emu4hrkieIize89/W+bALZYecRimJ2CeoY
         cZzpbCMyFHC1Mdc0ZGFFVapwW8+w7uBtGITf4/UbVnt758pwlpV5CbqsKfiulixwnPD0
         p6wnWiGBsnhZg8TYVUDYPrWfr8bQ5t3vjv50skyJ+6Dzg5FCFAzjzPrT/JtcIFl/tB5o
         Q68mxPdFfriCbvPdiGaKMufdzgMT8QeCDYqEG/gC8I0LM36OSh29DQPcTkCyLX3Qk0e6
         BgYIfXbwDqNyp97jMzh2YltKaUKo8S5d6Wfh5/2J7RGcw76Fpsg2gQ1rFx+xGGtsTAew
         eoLw==
X-Forwarded-Encrypted: i=1; AKwUvBwx/ChmPuTKM0NWB6uzKOqAiBT4YYtU1iwLM5/c/mFt4+Qw/8g7U3kA7K1x13d2A7VJjGfI1XwJ9b0xq5w=@vger.kernel.org
X-Gm-Message-State: AFuF++kun+w0YneRX84DpsV3kgYkGwSDwauHuFyDnXZVifp6a0/gXa0a
	lG1laoBfV8IXt4CB67pEqGWrKqWwWfdPvl2kWZnwIkaqtAvHC5Ot8gnTfNTU9lvJNUE=
X-Gm-Gg: AYBFou0uY2f2rBu/+30gcvKuuh8Gpse6mr90T3Lgu4dG9ixXy0WKgmKkF9odpF1WJug
	rVwWoJJ/unwaT6+1TxTdnr1Hko9te6kx4Usr1n2W4uL+yJAmua7biyp6bU8eouFMQrtwPYf+gaE
	RKPdLbBaVBgDoaiXjhz2IIcVD0nr2ksvy/Rs9p1FnrQZz2DzR1ns2DrWG2YNF48Z7+NYNAPW+vQ
	nDDoxfxUcOAvZQbZNuy3joOJOPCWgDbqwMCkoyb8BRXSE3jA/rySQ8ufyksVzuWjw3zPVT8ToQY
	743T7Mp/JVf5gvlAMOpxlN7mGCmbe/CBtG9JAcpxneIZkj90j44+LrZf+eeOGZnjAnjjWmM3ZIW
	xCAq5uVoFTVC1iPRJvBO0L8vC4HrV3h4sdc4lVqzheAhHpOxajpgg7k2EqECqMco9orOjROvDyn
	GtSzOtQk/2+kAVBEM9ecIIw/tK6elUKLigsX9RShW2atGHMnrh9gN8GxqAVFzdVXXSmyPqlI3zk
	SdR4fzNM5annWssYlA8WpOEPdg3sTwhkh4T/Wk3jo8wqEHaNuZP
X-Received: by 2002:a05:7301:4292:b0:351:aa6:93a7 with SMTP id 5a478bee46e88-3515de73f64mr4058162eec.38.1791419772468;
        Wed, 07 Oct 2026 17:36:12 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351735e316fsm3496694eec.11.2026.10.07.17.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 17:36:11 -0700 (PDT)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Simon Horman <horms@kernel.org>
Subject: [PATCH net 2/4] amt: send the relay General Query directly instead of via dev_queue_xmit
Date: Thu,  8 Oct 2026 00:36:03 +0000
Message-ID: <20261008003606.3666617-3-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261008003606.3666617-1-omar@blockcast.net>
References: <20261008003606.3666617-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

amt_send_igmp_gq() and amt_send_mld_gq() build the relay's General Query
with an L2 header, stash the destination tunnel in
amt_skb_cb(skb)->tunnel, and dev_queue_xmit() the skb so it loops back
through amt_dev_xmit(), which recovers the tunnel from skb->cb and calls
amt_send_membership_query().

skb->cb is not guaranteed to survive the transmit path -- qdisc, tc and
GRO may write into it. When the control block is clobbered between the
queue and the amt_dev_xmit() re-entry, amt_dev_xmit() reads back a
foreign tunnel and sends the Query to the wrong endpoint (in practice
the relay's own address with UDP source port 0). For a gateway that
shares the relay's L2 segment the mis-routed packet loops back locally
instead of failing, so the gateway never sees the Query and its
handshake stalls until the tunnel is garbage-collected.

The relay already holds the correct amt_tunnel_list when it builds the
Query, so the dev_queue_xmit() round-trip is both unnecessary and
fragile. Strip the L2 header and call amt_send_membership_query()
directly -- exactly what amt_dev_xmit() does for the query path --
freeing the skb on the sender's error return.

That leaves amt_skb_cb(skb)->tunnel with no writer, so delete the
relay's query branch in amt_dev_xmit() together with struct amt_skb_cb
and amt_skb_cb(). A query that still reaches amt_dev_xmit() is now
dropped like any other non-data packet instead of reading an unset
control block (and hitting WARN_ON(1) when it is NULL).

Fixes: cbc21dc1cfe9 ("amt: add data plane of amt interface")
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 drivers/net/amt.c | 53 ++++++++++++++++++-----------------------------
 include/net/amt.h |  4 ----
 2 files changed, 20 insertions(+), 37 deletions(-)

diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index a652c8c79..17dceeaa1 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -80,15 +80,6 @@ static struct in6_addr mld2_all_node = MLD2_ALL_NODE_INIT;
 static struct mld2_grec mldv2_zero_grec;
 #endif
 
-static struct amt_skb_cb *amt_skb_cb(struct sk_buff *skb)
-{
-	BUILD_BUG_ON(sizeof(struct amt_skb_cb) + sizeof(struct tc_skb_cb) >
-		     sizeof_field(struct sk_buff, cb));
-
-	return (struct amt_skb_cb *)((void *)skb->cb +
-		sizeof(struct tc_skb_cb));
-}
-
 static void __amt_source_gc_work(void)
 {
 	struct amt_source_node *snode;
@@ -789,6 +780,19 @@ static void amt_send_request(struct amt_dev *amt, bool v6)
 	rcu_read_unlock();
 }
 
+static bool amt_send_membership_query(struct amt_dev *amt,
+				      struct sk_buff *skb,
+				      struct amt_tunnel_list *tunnel,
+				      bool v6);
+
+/* Send the relay's General Query directly to the requesting gateway's tunnel.
+ *
+ * The query used to go through dev_queue_xmit() with the target tunnel stashed
+ * in skb->cb for amt_dev_xmit() to recover, but the control block does not
+ * survive every transmit path. We already hold the tunnel here, so strip the
+ * L2 header amt_build_igmp_gq() adds and call the membership-query sender
+ * directly. The sender returns true on error without consuming the skb.
+ */
 static void amt_send_igmp_gq(struct amt_dev *amt,
 			     struct amt_tunnel_list *tunnel)
 {
@@ -798,8 +802,9 @@ static void amt_send_igmp_gq(struct amt_dev *amt,
 	if (!skb)
 		return;
 
-	amt_skb_cb(skb)->tunnel = tunnel;
-	dev_queue_xmit(skb);
+	skb_pull(skb, sizeof(struct ethhdr));
+	if (amt_send_membership_query(amt, skb, tunnel, false))
+		kfree_skb(skb);
 }
 
 #if IS_ENABLED(CONFIG_IPV6)
@@ -883,8 +888,10 @@ static void amt_send_mld_gq(struct amt_dev *amt, struct amt_tunnel_list *tunnel)
 	if (!skb)
 		return;
 
-	amt_skb_cb(skb)->tunnel = tunnel;
-	dev_queue_xmit(skb);
+	/* Direct send -- see amt_send_igmp_gq(). */
+	skb_pull(skb, sizeof(struct ethhdr));
+	if (amt_send_membership_query(amt, skb, tunnel, true))
+		kfree_skb(skb);
 }
 #else
 static void amt_send_mld_gq(struct amt_dev *amt, struct amt_tunnel_list *tunnel)
@@ -1183,7 +1190,6 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 #endif
 	bool report = false;
 	struct igmphdr *ih;
-	bool query = false;
 	struct iphdr *iph;
 	bool data = false;
 	bool v6 = false;
@@ -1201,9 +1207,6 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 			case IGMP_HOST_MEMBERSHIP_REPORT:
 				report = true;
 				break;
-			case IGMP_HOST_MEMBERSHIP_QUERY:
-				query = true;
-				break;
 			default:
 				goto free;
 			}
@@ -1225,9 +1228,6 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 			case ICMPV6_MLD2_REPORT:
 				report = true;
 				break;
-			case ICMPV6_MGM_QUERY:
-				query = true;
-				break;
 			default:
 				goto free;
 			}
@@ -1258,19 +1258,6 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 			goto free;
 		goto unlock;
 	} else if (amt->mode == AMT_MODE_RELAY) {
-		if (query) {
-			tunnel = amt_skb_cb(skb)->tunnel;
-			if (!tunnel) {
-				WARN_ON(1);
-				goto free;
-			}
-
-			/* Do not forward unexpected query */
-			if (amt_send_membership_query(amt, skb, tunnel, v6))
-				goto free;
-			goto unlock;
-		}
-
 		if (!data)
 			goto free;
 		list_for_each_entry_rcu(tunnel, &amt->tunnel_list, list) {
diff --git a/include/net/amt.h b/include/net/amt.h
index c881bc8b6..ad844d65a 100644
--- a/include/net/amt.h
+++ b/include/net/amt.h
@@ -231,10 +231,6 @@ struct amt_relay_headers {
 	};
 } __packed;
 
-struct amt_skb_cb {
-	struct amt_tunnel_list *tunnel;
-};
-
 struct amt_tunnel_list {
 	struct list_head	list;
 	/* Protect All resources under an amt_tunne_list */
-- 
2.43.0

