Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792455971;
	b=yMv+1U8WFWKlp53C2/IwRyFMpWJNBloaEcle7IKKyGd5lp4XfhrOjN2oAdMdKcsjHKg8
	 UhM/VNgQsKu9/ImSQXB6Wm0jQqo+5OhRoREwyj3bTwOieZBjAHi5i7n+N6dHJI6g0/nZr
	 k5ti/WEmw9ipAacuPXbmw3aW25ozvQMxmD2+PnHq+E0fjTtDQhLOON8SUxE6Ny31giSN7
	 9ORlp7evWL8x5fW0PX0QK7gROCahLHa5jPB41T2/Fig8nawVLSDUYXwP+MWq3xLyFmoQW
	 NUjaggZcNbRYYHlKLrVxn50rc/pwoHTPWpH5WloPUGGPva4pVhszVMoncwf70IRX5KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792455971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3rmYFfzrOVrb1XmuRQml+2DQmSzQNSetRaB8KT5fx+8=;
	b=U4vxCPjbeYTawcf+h3s6MEuqoNc2HAQ/Bo08IX2uRf0is0NNq/36XWiux3t+6NJvulhR
	 QcLBi57p3EaPKs5a+T13/2NVBF+//JM66JP7nsoUUrolauyXv9hiDdscUneqJXptedxpr
	 TKYm/yuQMLZQWF5Ch6/eORcT8i3tCHGkTmWWWJCv5oqbDyLlTi5PhVNt97MFzqBwbN13T
	 2PqQB6dpHXbA8aTuuo5iGaiXGk6x0WoZ/j4rNND+d3KR6fi5Nibl0CNRQiEMmL8DtIOKL
	 m2rIB7jXKjnS7VSmqMFF7EEb0BHbFwh5lJSBlSC1GkcVVJYewlRYu1KLNBRlE4a//pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=q8LPQURe;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61946606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61946606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=q8LPQURe
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-35943f55c06so307721eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1792455965; x=1793060765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3rmYFfzrOVrb1XmuRQml+2DQmSzQNSetRaB8KT5fx+8=;
        b=q8LPQURe4Sv1IuvjdlUAbTfW+kN5LKl7qZUmEzpeVni1/cHzOYZajVVesvTc13VHRh
         WULN2zeEMih9Me5IzV4S9XdWyS8VgdxOR4lro2wo6WAm6bWmJ+ObsrNecEaUjib4h6Oe
         ChcK3sn5yubBUbYxFGJzArZpBbwKhujwvqDvVcqqg7AUdMBPH5932m7+APe6AxFbWX/R
         J7r3Mwbmj0lqrMYQr8u+5uTIYzTcKQxH9oetwXxnQvlJOmEOIDBiEYpp71Ly6/4ZQfAm
         O6XeXi0kw7fLA47fqsHWzxgqafPJg+6dtLuVREecosoz/z4wX6gb7M0MItLLQjU4Gh4C
         0W8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792455965; x=1793060765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3rmYFfzrOVrb1XmuRQml+2DQmSzQNSetRaB8KT5fx+8=;
        b=PNMB9p5HsPJxXasdYW2owOAtGPe5ZovUJn3UR1imiYhMRlE9GUkj9On53fI4J+mNXc
         hibDnJxKf7tw3rZYIRMUT35pXkvUnkVwZdZEKjI7fu7wVHOredncyYoy4et1GLEMTTnY
         NZUxRDsyMZUA7FpzxNnTUGB4naKeRIqS0yBMFY+9CoTVklbklsJ9p+GMuXB071EVC73n
         uU5UN5Y2mGvzrJTFA/AnSNg6hsYOdV/c3nPAE0WMH7FtwFn08nnDzDgpBqeBno7tiK3D
         XYmXGLCxg2QHRs7Qj702XlHHYlo/sNmC1+mqoyWGINHVGa7UR02IrY+MGM02ssTVzgaI
         rf0g==
X-Forwarded-Encrypted: i=1; AKwUvBxMErAg9H8XKievPL5fv4ke7lvBSwaVraB+muQNXoD916fvZuBjFVtu02Fq8mdlsah1gybn10JTv50AZjY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzuvVZ8arH/oljCMRVrJ11JpZvAAGwQtrVzuND2P+UOeoxikYG
	M4AtBaSvoJDMi7KoT2nLvgMaYTe1ddLN8nJvoSqjSEzfNPrIP3UCHac4zcvMBvkkiEA=
X-Gm-Gg: AYBFou3mgiQhZf3tNQpWv+y7Mo8mh7dKa6XCK3jwq1PiT29PPzAK/oWA5F3xE1pZHqp
	SPGFOMmvBpwDQ3mDxGPk7yHDxvak0FuUeW0jt4oQPBZdVOM0iCE5u4HYssgGNtAvLS7IlMVSQ7Y
	kbbnZSaVs0yVJWMBst+6SGnoP1e8oOhgX3mAr3HpwhOz3xnEGLqQlMGhd+UBH6BhsHsNl2qJwz9
	f0L/tWErsgU2t/peKZP3NW3a8PPkE/6wvbfAI8dTbjL9oqjQxKBef8BnV5yfci0BKiMluojcRiV
	BxpZLbTcUCxEMe7X0J7/BzCbR3ebWakTxR1yIk4j3kdX5l2f/UNV4phCa/d5vNv6UFv6yTNgY+C
	5B+EGAgI9OLHgoTpUjauRQhQlosVRKfF8vK21oAJxA1rk7TMrJegzWBgUdz3NxLBkkfyx/+zjAj
	Hpo0OH2Z5Ggj2oZSNj0KbFuauKzQOCG02Q4VXix/QNvAH1CD40YIFTC962KwcVH7l3epDtY+GNo
	HPaxVRNesTDn9BuuuPNgUThYxgOboNBw45sTXWAMF9kpattHL5JmZsS+vtBw24bzRzjFMqQ/r4=
X-Received: by 2002:a05:693c:42d2:b0:357:ee3a:267a with SMTP id 5a478bee46e88-365f819ca19mr830113eec.2.1792455965255;
        Mon, 19 Oct 2026 17:26:05 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608258aa66sm44748072eec.20.2026.10.19.17.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:26:04 -0700 (PDT)
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
Subject: [PATCH net v4 4/5] amt: make pre-query report drops visible
Date: Tue, 20 Oct 2026 00:25:56 +0000
Message-ID: <20261020002557.3984927-5-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020002557.3984927-1-omar@blockcast.net>
References: <20261020002557.3984927-1-omar@blockcast.net>
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
also counted as a drop.  Return NETDEV_TX_OK directly once the report has
been sent, so tx_dropped counts only reports that were discarded.

The device is LLTX, so amt_dev_xmit() can run on several CPUs at once;
use DEV_STATS_INC() for its tx_dropped and tx_errors updates so
concurrent increments are not lost.

Fixes: cbc21dc1cfe9 ("amt: add data plane of amt interface")
Assisted-by: LLM
---
 drivers/net/amt.c | 42 +++++++++++++++++++++++++-----------------
 1 file changed, 25 insertions(+), 17 deletions(-)

Signed-off-by: Omar Ramadan <omar@blockcast.net>
diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 960a08d..f83afba 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -704,7 +704,7 @@ static void amt_send_discovery(struct amt_dev *amt)
 				   IPPROTO_UDP, 0,
 				   amt->stream_dev->ifindex);
 	if (IS_ERR(rt)) {
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -714,7 +714,7 @@ static void amt_send_discovery(struct amt_dev *amt)
 	skb = netdev_alloc_skb_ip_align(amt->dev, len);
 	if (!skb) {
 		ip_rt_put(rt);
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -759,7 +759,7 @@ static void amt_send_discovery(struct amt_dev *amt)
 	ip_send_check(iph);
 	err = ip_local_out(amt->net, sk, skb);
 	if (unlikely(net_xmit_eval(err)))
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 
 	amt_update_gw_status(amt, AMT_STATUS_SENT_DISCOVERY, true);
 out:
@@ -795,7 +795,7 @@ static void amt_send_request(struct amt_dev *amt, bool v6)
 				   IPPROTO_UDP, 0,
 				   amt->stream_dev->ifindex);
 	if (IS_ERR(rt)) {
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -805,7 +805,7 @@ static void amt_send_request(struct amt_dev *amt, bool v6)
 	skb = netdev_alloc_skb_ip_align(amt->dev, len);
 	if (!skb) {
 		ip_rt_put(rt);
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -852,7 +852,7 @@ static void amt_send_request(struct amt_dev *amt, bool v6)
 	ip_send_check(iph);
 	err = ip_local_out(amt->net, sk, skb);
 	if (unlikely(net_xmit_eval(err)))
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 
 out:
 	rcu_read_unlock();
@@ -874,7 +874,7 @@ static void amt_send_igmp_gq(struct amt_dev *amt,
 
 	skb_pull(skb, sizeof(struct ethhdr));
 	if (amt_send_membership_query(amt, skb, tunnel, false)) {
-		amt->dev->stats.tx_dropped++;
+		DEV_STATS_INC(amt->dev, tx_dropped);
 		kfree_skb(skb);
 	}
 }
@@ -918,7 +918,7 @@ static struct sk_buff *amt_build_mld_gq(struct amt_dev *amt)
 
 	if (ipv6_dev_get_saddr(amt->net, amt->dev, &ip6h->daddr, 0,
 			       &ip6h->saddr)) {
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		kfree_skb(skb);
 		return NULL;
 	}
@@ -962,7 +962,7 @@ static void amt_send_mld_gq(struct amt_dev *amt, struct amt_tunnel_list *tunnel)
 
 	skb_pull(skb, sizeof(struct ethhdr));
 	if (amt_send_membership_query(amt, skb, tunnel, true)) {
-		amt->dev->stats.tx_dropped++;
+		DEV_STATS_INC(amt->dev, tx_dropped);
 		kfree_skb(skb);
 	}
 }
@@ -1312,7 +1312,7 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 		group.ip6 = ipv6_hdr(skb)->daddr;
 #endif
 	} else {
-		dev->stats.tx_errors++;
+		DEV_STATS_INC(dev, tx_errors);
 		goto free;
 	}
 
@@ -1325,12 +1325,21 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
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
@@ -1359,8 +1368,7 @@ found:
 	return NETDEV_TX_OK;
 free:
 	dev_kfree_skb(skb);
-unlock:
-	dev->stats.tx_dropped++;
+	DEV_STATS_INC(dev, tx_dropped);
 	return NETDEV_TX_OK;
 }
 
@@ -2720,7 +2728,7 @@ static void amt_send_advertisement(struct amt_dev *amt, __be32 nonce,
 				   IPPROTO_UDP, 0,
 				   amt->stream_dev->ifindex);
 	if (IS_ERR(rt)) {
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -2730,7 +2738,7 @@ static void amt_send_advertisement(struct amt_dev *amt, __be32 nonce,
 	skb = netdev_alloc_skb_ip_align(amt->dev, len);
 	if (!skb) {
 		ip_rt_put(rt);
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -2776,7 +2784,7 @@ static void amt_send_advertisement(struct amt_dev *amt, __be32 nonce,
 	ip_send_check(iph);
 	err = ip_local_out(amt->net, sk, skb);
 	if (unlikely(net_xmit_eval(err)))
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 
 out:
 	rcu_read_unlock();
