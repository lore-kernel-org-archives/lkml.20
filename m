Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794012590;
	b=EvpMclVAqSppyhnuq71oblObw3oUKi3O7rwoUkX9ACR4S51o5hLJozxeNdqrDLdG52J9
	 C6XUjixVNe7JY85G1cWtquTlJRB50Fe9f5Y1htAX6kM/1mYigRD6mAExBM0Np+jh6XC5z
	 ppC2mc9KLKo1p4IUwiEj2a90h8ii23ia/ZzRexCX2H0g2f6RUmUpKFVjCDf9WFEwtLM3o
	 FZ9Qgn8VWn2x4hBdJH+6R4bh4CIgwdPMVSbKJknD2Cr+Ps/7SDWHaidIEcJG34qkX+944
	 BM/ORtTJDdGDNRzIbFoqIgcUAbSWuoYjXW7uF20V4jHq92H50hd2tgbOMnXeXY24IqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794012590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qU6qsrqQpVZ3NoUQuR/wRikyWPdKsBxhhM5wA6FCjv4=;
	b=JeF9i+976/SDIetLF9HrKk9DZ6HEzijCduYb+gYihoIEHvX+EnRuW0KAtup9emsLxGku
	 LnrfqkDfmut5mtg/q4XKYhiP/W0ML038sZ/1hOijwnnHyE+Epfx8JFOadHU3CbC8ZGc7r
	 Zolaswa5EAoeQBAsE2eL2QiMurT8i9HGdS/GRoErhTCINQ1LuMuu9kYLVBiydN3O102L7
	 zcrn2gfP+7A3IG0ibP2CUGS+wbhTywCi+wYDtdRk46sU8AaB1OsQ7prw7Vxr5cDlDGTYC
	 ALs/YOfqfO+TyMnonivAlQRZOxrtpimD5wX0Xo/P0pEfnTEmM6O/8l5NQRP7vTnQlYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=ft2hyPHH;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A6E60733DD
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:49:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67A6E60733DD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=ft2hyPHH
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-15ea896ddc8so2091660c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1794012588; x=1794617388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qU6qsrqQpVZ3NoUQuR/wRikyWPdKsBxhhM5wA6FCjv4=;
        b=ft2hyPHHTxyZ4WscPODofEoR0SyAXLHVElZKcudmyQDhHfk1GZL2BdtXzeyU9JdP/j
         hlLuzBV1mLbGjfWYnN6QodBZZ5NzhNLMX3U8sIdNjmef3MGMWzW/lGcrmUBMWPtMnDyN
         VwHv4PZSEpj/pkR97FUKVY/D4GYnMi7UuVptqwfI8qMECm0w1tLubQgrzNxW0S+Nt6q9
         u2ziP4bhubYO2SeU5t7A0sxDgZPW+EN1xYM1lZMfTNCt7qg4+v1auyxL0Vk3gqY40BCv
         YTFLAI09NdwbFtxQXOklQw4mvkvFJWqXUYAYCoDVmHfNtdGyNxeJW6y/gdS1MMsGRHFm
         lWlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794012588; x=1794617388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qU6qsrqQpVZ3NoUQuR/wRikyWPdKsBxhhM5wA6FCjv4=;
        b=C5y2U8sUpjdlsm3uoJQ4/xsDUKZL+3j+bzOiS/a4l1YYRAt30QUf43RfjTcLa0CQRS
         iy2xN5cSGuNUVZHuTTCS7QTlz6VNLSoNwjOC4WIWvK5Xn5Vib+fijkyAQU81BMuG7oDE
         bczkSaiW45IhLI4QUwor/4gdE1skB8G5W0MJQhKU0SarWvZj7KNJMJACN7o2UhHGbhwR
         45HyNS02FjnQZJ5bGwmxhumtwLRWxgY+f9o1IOmqbfGz9WnbacrkVkYND7YHw1YTY5D1
         d3Ssq+pxa26TXshKiZF47mPb8UuwEEgOZVUsPiIf1opk56P6E1YKdHusb7iktbayIhO4
         sWPg==
X-Forwarded-Encrypted: i=1; AKwUvBzlJHuidxiQNVwD3MBhB51LrI1Fj6z06VlXMfrR5jAdZKtLtS4AuwoX4fPOIUFQNHeNBSSyodK8QHQu6Jk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8FBwcTvJJdd5O/Dfd/ZJBng4wwju8NAy7bac3DcWX+tkEZWU1H
	YmhfTQhdYlWrFetPanmIe6oSEI8O57wq7VrCFJDDxytwRlxBroqJsSjdyXbMV0MQpo8=
X-Gm-Gg: AYBFou1OKrrw+3kdP9cq2flQlpEy96AxMknM9W76/+kGHFkagIuW1X1zw7tbEsTI0sD
	xYdUWh6Y+fP1EGxdDDUhQsG1kMEV1nPsxfXWcNV061NjLZxByKh/868B8wPMYuDD1vTT08lQUyh
	XwZsClsv4DQ5tO27h74UR1wrKmVkA1YnO9smv6fGfT6ulKyNCzy+5CPpPK+yfe6eMdb+OY/6CBm
	L29xTq62SGwaeH0l4KQf0hxz2Ig2LMBEgQViLS3HmVejuuUFZbcjC580qrMkvygSGm+xTH5Qfcf
	oFsxxmsd+AdbQHFpJvzAo77BUHkJbVN6XQ3UwcaZBoG4Yp/MZ38htYm6AgVhl5GfYAYaKcv10mr
	F1wAen4bye1sRxOl9FOC1X6M1G90hq8fqwtZLdw7ItLK9ivVd9Pa1HwmmvHjkcgFZKVe9icHQQH
	DkjIvBWNSEssmyMlaZtIKqV6jo5reDAgi1CNP+nPBgeqxeykVgwz8Uev/fM04Mt+JCeeeBLsiLo
	uoMPH1J+sJfMkak4p/22iXHlj6HF8OxEYcOe1fSfnfprcp2+JPjwIi2mb80JgxhaNPds1Coyud/
	LNLMeVqASRXH6Xe4ATVoJ8GliXJhjCrX8VEdRV50vWCajrebiRlMXbqnjecJf9Gbn6RQSo4=
X-Received: by 2002:a05:693c:40d6:b0:368:4acb:f8a with SMTP id 5a478bee46e88-36f75b2c11fmr5999546eec.17.1794012588456;
        Fri, 06 Nov 2026 16:49:48 -0800 (PST)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa8e3a718sm11021294eec.4.2026.11.06.16.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:49:47 -0800 (PST)
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
Subject: [PATCH net v6 5/6] amt: make pre-query report drops visible
Date: Sat,  7 Nov 2026 00:49:34 +0000
Message-ID: <20261107004935.2627329-6-omar@blockcast.net>
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
index 6d5d43b48..e430f38c4 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -707,7 +707,7 @@ static void amt_send_discovery(struct amt_dev *amt)
 				   IPPROTO_UDP, 0,
 				   amt->stream_dev->ifindex);
 	if (IS_ERR(rt)) {
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -717,7 +717,7 @@ static void amt_send_discovery(struct amt_dev *amt)
 	skb = netdev_alloc_skb_ip_align(amt->dev, len);
 	if (!skb) {
 		ip_rt_put(rt);
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -762,7 +762,7 @@ static void amt_send_discovery(struct amt_dev *amt)
 	ip_send_check(iph);
 	err = ip_local_out(amt->net, sk, skb);
 	if (unlikely(net_xmit_eval(err)))
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 
 	amt_update_gw_status(amt, AMT_STATUS_SENT_DISCOVERY, true);
 out:
@@ -798,7 +798,7 @@ static void amt_send_request(struct amt_dev *amt, bool v6)
 				   IPPROTO_UDP, 0,
 				   amt->stream_dev->ifindex);
 	if (IS_ERR(rt)) {
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -808,7 +808,7 @@ static void amt_send_request(struct amt_dev *amt, bool v6)
 	skb = netdev_alloc_skb_ip_align(amt->dev, len);
 	if (!skb) {
 		ip_rt_put(rt);
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -855,7 +855,7 @@ static void amt_send_request(struct amt_dev *amt, bool v6)
 	ip_send_check(iph);
 	err = ip_local_out(amt->net, sk, skb);
 	if (unlikely(net_xmit_eval(err)))
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 
 out:
 	rcu_read_unlock();
@@ -877,7 +877,7 @@ static void amt_send_igmp_gq(struct amt_dev *amt,
 
 	skb_pull(skb, sizeof(struct ethhdr));
 	if (amt_send_membership_query(amt, skb, tunnel, false)) {
-		amt->dev->stats.tx_dropped++;
+		DEV_STATS_INC(amt->dev, tx_dropped);
 		kfree_skb(skb);
 	}
 }
@@ -921,7 +921,7 @@ static struct sk_buff *amt_build_mld_gq(struct amt_dev *amt)
 
 	if (ipv6_dev_get_saddr(amt->net, amt->dev, &ip6h->daddr, 0,
 			       &ip6h->saddr)) {
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		kfree_skb(skb);
 		return NULL;
 	}
@@ -965,7 +965,7 @@ static void amt_send_mld_gq(struct amt_dev *amt, struct amt_tunnel_list *tunnel)
 
 	skb_pull(skb, sizeof(struct ethhdr));
 	if (amt_send_membership_query(amt, skb, tunnel, true)) {
-		amt->dev->stats.tx_dropped++;
+		DEV_STATS_INC(amt->dev, tx_dropped);
 		kfree_skb(skb);
 	}
 }
@@ -1325,7 +1325,7 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 		group.ip6 = ipv6_hdr(skb)->daddr;
 #endif
 	} else {
-		dev->stats.tx_errors++;
+		DEV_STATS_INC(dev, tx_errors);
 		goto free;
 	}
 
@@ -1338,12 +1338,21 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
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
@@ -1372,8 +1381,7 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 	return NETDEV_TX_OK;
 free:
 	dev_kfree_skb(skb);
-unlock:
-	dev->stats.tx_dropped++;
+	DEV_STATS_INC(dev, tx_dropped);
 	return NETDEV_TX_OK;
 }
 
@@ -2749,7 +2757,7 @@ static void amt_send_advertisement(struct amt_dev *amt, __be32 nonce,
 				   IPPROTO_UDP, 0,
 				   amt->stream_dev->ifindex);
 	if (IS_ERR(rt)) {
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -2759,7 +2767,7 @@ static void amt_send_advertisement(struct amt_dev *amt, __be32 nonce,
 	skb = netdev_alloc_skb_ip_align(amt->dev, len);
 	if (!skb) {
 		ip_rt_put(rt);
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -2805,7 +2813,7 @@ static void amt_send_advertisement(struct amt_dev *amt, __be32 nonce,
 	ip_send_check(iph);
 	err = ip_local_out(amt->net, sk, skb);
 	if (unlikely(net_xmit_eval(err)))
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 
 out:
 	rcu_read_unlock();
-- 
2.43.0

