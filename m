Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B30B3D47A5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102030; cv=none; b=Jio5kQy7NgGiOefMakhTwxHr8GV0kNwj99CSmIyOiVsznQVtaJw7zz2Rne/owPqsZgYPscTx19nlTreC3e8yq1bLUwczAMWMfsHRNCOOH3Hp/RPjqXuwH6fVtEOGaOLwGV7BH3CT7RL856WhOhupe8PB9A/9UHmOWUg5Vix6WkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102030; c=relaxed/simple;
	bh=s53IEMx20QGD95eVCvyazgZUfRWdZo8BhtPzsdTglNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dYwiQu9P/1aYLHfDkrb6yA5EpZJhiayt0PUskxjD5dfkapZueA1o+tZx4Fm/rcdk4XTldiXOeO8KJ5kAbUkaUixg1qyL5g4dSofWtcQsbySyBFhC7XHd93fJv2VzF08VxkOh19wRPrlClsT8l8pCMUixPWM+ftw2EemZmwF+jC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net; spf=pass smtp.mailfrom=blockcast.net; dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b=OLCkCIyi; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.b="OLCkCIyi"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3535a54bed9so3861806eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1792102023; x=1792706823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z0+QDSWUPiFLrjdemWwRSI1v+RDWJruiK7uscvGKei0=;
        b=OLCkCIyi4sBv2Kci6Qbxg9+JoB9AjHe626ZAZ8BI6Mkd5HX/RCz33pmbGkjXgeY5gU
         fbpOjuQDMaVMzOjvLy2FGRJzXW4KFdoUGwroUCp1RV/kv4DWPly+KrJQM3ZNlug0xAhV
         +9YxZE43eGMdHsUrw3oPsEHPNLYM3mT9DqdC8IcLGbGTacVw65Kfr7Kf/fcY3p7KVFxY
         KJbcOJSiIjNsBr5NRRAWlIBDdNcHbixLSkzwkDJySYJ6M9ZXaiVjhdh3QBGdgKB0CDTp
         oteBvNanmpWs4WfubqvM7GZoS9EswxvPZ/tVNZriZNyX3WOHRyfcQasNdQPO1tMCQ5ji
         8ucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792102023; x=1792706823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z0+QDSWUPiFLrjdemWwRSI1v+RDWJruiK7uscvGKei0=;
        b=GLo64YsgzpW7SOYsenMTa84xUicqtBDefHizf0FytPhJ0q8c2v0A4KNZENCJ5YiDHF
         R4u3+qiCPkhVi1rgisPSr1OoQugJhkG3cb8y+gy2Ea1YxfVpPmX9fQQkp8KRVmDgSCB6
         BBdzKlngq1oTa87YM8ziDQmhzkvABSprM6U+sX60/o+mq8xXkvL0wxocThi8zSsjXOGv
         6ZYmJqQHzxX9EVeSnM8kaXCgUz1DaQPyahvFtAUURzE7wrOYbeRwkGwXYI5nXup8eeOb
         ltNvoisvUH6AH1hmJ29yo7daYjVpGfu645IR8XirEw8N4oEVZpN8L5eeWdSP1Zx79zJg
         yd6A==
X-Forwarded-Encrypted: i=1; AKwUvBzgfucez5lypImtfhkd/2nYFkVpwSrfJgKjnIiP/pQTo6ndvSNWpOAuUn61TuV4QLmHgqqAIitcg4Es+r0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOYQjkuyV3au5F3642/i5rDzfG7M1kQQY57ClMK0Uaiu0kVgK8
	5xYXV8ulAjumhvw8kEM7yQoFEDm5KlIUjC3QucZ1O5vOOLY2ItrVODZBirFuRKb4Iw4=
X-Gm-Gg: AYBFou08MxI5MykOUmkMRxx/GsEExoLblZGS0Sctv38536KUGAwcpy+G5dRdTCAs4Tg
	tdKNQWxG0p8fl/WYOfaJUsLTw0QfYfT7yVqEglpN4WbMLNqgw+Zx5ZcyNi9cT/GywiwfiDSWnwQ
	dVssHC9ofHkJ1hZzOevb4kiMh5ftCfcnvaHyQn2km8e7cKdY9Qwhdghw4ZSNWs0rYfmfaQyp1M0
	ATv5QnLW3h3aDC3lVH4HaFrMDyLXEGtwOq08uCcqkP3AyvNycEOfEQ3FISo4474FuS6R9EZ/AWy
	jpWJut+HlXahV2lRWAlDSb3N06CV7fXuHFlvZZ0m8PWrCDp1JecRdE+N+GVZnkEA2DBVezRkqwa
	R5+VhBKL4twuR3YEbeP+2wrSpENthTRccIwEljG9A3U3iDravC8AQLvwJqLWORlhVxkxGgLltNm
	qXJrcXhoczOTQMte93RUBtgnlEDvqQpTYLNoE83IqXeMcDREoTKgnz8+rPI+lL56vbLg5ZwFLde
	tGzrLQ1boHL82YM9hUgEeHv+HQvXY/Li2+y4fdP
X-Received: by 2002:a05:7301:1a17:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-3537e0333e8mr25772738eec.7.1792102023071;
        Thu, 15 Oct 2026 15:07:03 -0700 (PDT)
Received: from devbox.ts.blockcast.net ([2602:f74d:1::32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0cab0sm1016445eec.3.2026.10.15.15.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 15:07:01 -0700 (PDT)
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
Date: Thu, 15 Oct 2026 22:06:47 +0000
Message-ID: <20261015220648.1545576-5-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015220648.1545576-1-omar@blockcast.net>
References: <20261015220648.1545576-1-omar@blockcast.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

Signed-off-by: Omar Ramadan <omar@blockcast.net>
diff --git a/drivers/net/amt.c b/drivers/net/amt.c
index 470dbbd..c6924ab 100644
--- a/drivers/net/amt.c
+++ b/drivers/net/amt.c
@@ -650,7 +650,7 @@ static void amt_send_discovery(struct amt_dev *amt)
 				   IPPROTO_UDP, 0,
 				   amt->stream_dev->ifindex);
 	if (IS_ERR(rt)) {
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -660,7 +660,7 @@ static void amt_send_discovery(struct amt_dev *amt)
 	skb = netdev_alloc_skb_ip_align(amt->dev, len);
 	if (!skb) {
 		ip_rt_put(rt);
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -705,7 +705,7 @@ static void amt_send_discovery(struct amt_dev *amt)
 	ip_send_check(iph);
 	err = ip_local_out(amt->net, sk, skb);
 	if (unlikely(net_xmit_eval(err)))
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 
 	amt_update_gw_status(amt, AMT_STATUS_SENT_DISCOVERY, true);
 out:
@@ -741,7 +741,7 @@ static void amt_send_request(struct amt_dev *amt, bool v6)
 				   IPPROTO_UDP, 0,
 				   amt->stream_dev->ifindex);
 	if (IS_ERR(rt)) {
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -751,7 +751,7 @@ static void amt_send_request(struct amt_dev *amt, bool v6)
 	skb = netdev_alloc_skb_ip_align(amt->dev, len);
 	if (!skb) {
 		ip_rt_put(rt);
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -798,7 +798,7 @@ static void amt_send_request(struct amt_dev *amt, bool v6)
 	ip_send_check(iph);
 	err = ip_local_out(amt->net, sk, skb);
 	if (unlikely(net_xmit_eval(err)))
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 
 out:
 	rcu_read_unlock();
@@ -820,7 +820,7 @@ static void amt_send_igmp_gq(struct amt_dev *amt,
 
 	skb_pull(skb, sizeof(struct ethhdr));
 	if (amt_send_membership_query(amt, skb, tunnel, false)) {
-		amt->dev->stats.tx_dropped++;
+		DEV_STATS_INC(amt->dev, tx_dropped);
 		kfree_skb(skb);
 	}
 }
@@ -864,7 +864,7 @@ static struct sk_buff *amt_build_mld_gq(struct amt_dev *amt)
 
 	if (ipv6_dev_get_saddr(amt->net, amt->dev, &ip6h->daddr, 0,
 			       &ip6h->saddr)) {
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		kfree_skb(skb);
 		return NULL;
 	}
@@ -908,7 +908,7 @@ static void amt_send_mld_gq(struct amt_dev *amt, struct amt_tunnel_list *tunnel)
 
 	skb_pull(skb, sizeof(struct ethhdr));
 	if (amt_send_membership_query(amt, skb, tunnel, true)) {
-		amt->dev->stats.tx_dropped++;
+		DEV_STATS_INC(amt->dev, tx_dropped);
 		kfree_skb(skb);
 	}
 }
@@ -1258,7 +1258,7 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
 		group.ip6 = ipv6_hdr(skb)->daddr;
 #endif
 	} else {
-		dev->stats.tx_errors++;
+		DEV_STATS_INC(dev, tx_errors);
 		goto free;
 	}
 
@@ -1271,12 +1271,21 @@ static netdev_tx_t amt_dev_xmit(struct sk_buff *skb, struct net_device *dev)
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
@@ -1305,8 +1314,7 @@ found:
 	return NETDEV_TX_OK;
 free:
 	dev_kfree_skb(skb);
-unlock:
-	dev->stats.tx_dropped++;
+	DEV_STATS_INC(dev, tx_dropped);
 	return NETDEV_TX_OK;
 }
 
@@ -2653,7 +2661,7 @@ static void amt_send_advertisement(struct amt_dev *amt, __be32 nonce,
 				   IPPROTO_UDP, 0,
 				   amt->stream_dev->ifindex);
 	if (IS_ERR(rt)) {
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -2663,7 +2671,7 @@ static void amt_send_advertisement(struct amt_dev *amt, __be32 nonce,
 	skb = netdev_alloc_skb_ip_align(amt->dev, len);
 	if (!skb) {
 		ip_rt_put(rt);
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 		goto out;
 	}
 
@@ -2709,7 +2717,7 @@ static void amt_send_advertisement(struct amt_dev *amt, __be32 nonce,
 	ip_send_check(iph);
 	err = ip_local_out(amt->net, sk, skb);
 	if (unlikely(net_xmit_eval(err)))
-		amt->dev->stats.tx_errors++;
+		DEV_STATS_INC(amt->dev, tx_errors);
 
 out:
 	rcu_read_unlock();
-- 
2.43.0

