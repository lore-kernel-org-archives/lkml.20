Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B76D5304CD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 18:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790793584; cv=none; b=uG3Ayo50AnwHS7JeLOKncsKtI9VTRW57YziBdUFe+SCCROfIWG5F4D+iOCwO3eSONFY54CyaYfDcit0+erYmS2taXlFALzTYw+5onm00K0x3XdOFzZWh+AV2O2b6mME2fRmbygZkte6GxWS/4oSeqEvKuJ5x6iudJfrsTbHovb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790793584; c=relaxed/simple;
	bh=w6XPpeMwKzZkNE7fji+NLuQxu4rxTqoPtODz0iot5jQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KtGgPv0fuEq4+QwM0BYXVV5krZnITEInctPQ00Er984XhaUZlTcEKN5lL9XFzIyX0HbAWWVawieDQ2dbvaY2bZ+0EvSXboQher+1OtCDvnISsTrgIYvDeZ86DkFPHdB9rP/7MDNgja8pI3rxVp747cJIQ3G51mcttARDf1Bf3Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wton5LsD; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wton5LsD"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a75ff20a6eso26974911fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790793581; x=1791398381; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D4RhzO/zfkZ4EEl4lXFcxENTNheBNqhjEkGu9UwEz/Q=;
        b=Wton5LsDsJ/AC/MtqdabHoRXLR6yJpNWM6ac9LQ++uTRDU0qvSyDCR3b063JlLCKk8
         /0Rzaz/MQdO+royyxce1NRL97ndfuxlwFimeJ+iJFHIOmoxzawEpx5qfwoWKIgt1RRjS
         ChcehLQqufhXrmJkta4ydpPeOGwFZlkmsnCFYbZ3u22KFM3cS9/Tcjf9X1fK7XMdYwyx
         DLO11aL/D3maQ9tytPaDJaORUhPLif2af046hZ8kFgZ1zPmsP2SjmQ7cUIjwzcLNEzjL
         9I6WiOahF3vUfnxLn2JhdftysLFL+mfFnlSg+/G3CAXfyaXKAEZuL6CRI7zNRxI/qgqO
         KZGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790793581; x=1791398381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D4RhzO/zfkZ4EEl4lXFcxENTNheBNqhjEkGu9UwEz/Q=;
        b=1FGbkyNBemiTwU+2saynQGWzEyems8UWGXukfXyGTs3ndpICnlQRcjzehfEmADoo15
         8tDY+94AdQm4mgHILOFOR4tC7yTPFPZJYyNhpjGysr6G8A2B+GyIkJWL2M8n7DD0fnXr
         ucinn8OHpJ9nZK1hcj2nLWSObWiEHgA5J7f26ctLEbJWLoQeEnf9T43IdZYx0Y0HEIHG
         kCX7ZfymtmTo93yHEMfcCcfUn0DeWyPKTw/Clr3UK1ZNsbP9z9OIE38NQkTB53Ex6Era
         NF3nXOiaf6I4QqCdwDnrTL/ULjMnLbz4mPLOQFLuf4zUF/WPr9QfBy6QplThG6aL3mqX
         /OHA==
X-Forwarded-Encrypted: i=1; AKwUvBzdDXs819cj8f6a/k8ArteY6mVlfkmQ6polSS37stw4/B7EusS53gNpEd8q6MQOyRwdVrbrfuJCH1ciPLY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJJZyq83J/0T5Ws3YB0ak3suG0g7nYUu9hQC315gsYk5rwRvrRb
	samLQdizBN72FnKNd/Zy2wfZQdh0GPo1O1TYM7OIdoVZXL78CX+rlWakgOm5S+wK
X-Gm-Gg: AYBFou3a1lYFe8dx9chGIZyI3Q5BUf887O+NimQv9QtbTNfwbqDitHyV6GxueLXx0mo
	WakzOIetO2ZZKzXK9lx1O55jm8Y+GDncpF1cDKGvvbU7h7oej8nzd8L9GyaYLTsjROIqO4k03pl
	ldMXAcXU//fjrTCWDHjau/12VGTE7/dklvnMnJ1x4AJEHsv6wc/QY85oGxBiA4y2orn3EdcBUPF
	XjTa74x5SNJOGDx8UG/32BZv6R3GJJJXluW6e8E12AWPnGr5ievvgYkajrqKMGNADZMCtCgZ6Hr
	pFH9pSTF2Nf0POhh0TuNXoSniS+wnZuJeSgt30fQsNdXKN3BbHfzIhOUIJVVIiRS0aKZcy2NMq0
	ruVIYLhXLvZDZTdlsDJHzcIsZdRh/7aYm6Tr4Jfbzu2z/gBKKWyYbClmVb+byVBOLT9NvvkUOgY
	XQhOu1U/tWNzqhqxUfuG3ZMX3RT8Y+/PIX+2JokW8qHiOazXZlSNf4Oyu3jR1VDX5CE1EYswxZ1
	d+hSfIzALtb3cyDwI4+fh38AQUTbb/15HG3o4HVIKKg
X-Received: by 2002:ac2:47f9:0:b0:5b7:6686:45a9 with SMTP id 2adb3069b0e04-5ba405eac6fmr689667e87.37.1790793580618;
        Wed, 30 Sep 2026 11:39:40 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.169.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbb999sm156593e87.62.2026.09.30.11.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:39:40 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v5 11/14] ip6_gre: make prepare_ip6gre_xmit_other() void
Date: Wed, 30 Sep 2026 21:39:07 +0300
Message-ID: <20260930183910.3151873-12-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260930183910.3151873-1-littlesmilingcloud@gmail.com>
References: <20260930183910.3151873-1-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

prepare_ip6gre_xmit_other() copies the flow template of the tunnel and
picks up its encapsulation limit, DS field and mark. Unlike its IPv6
sibling, which fails when the packet's tunnel encapsulation limit option
is 0 and so forbids encapsulating it again, it has nothing to fail on:
its only return statement is "return 0", and it has been that way since
commit 41337f52b967 ("ip6_gre: set DSCP for non-IP") added the function.
Its caller still checks the result and bails out on a branch that never
runs.

Make it void and drop the check, the way prepare_ip6gre_xmit_ipv4() is
already called. The next two patches give every failing branch of the
transmit path a drop reason, and this one would otherwise get a reason
it can never report.

Assisted-by: LLM
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 net/ipv6/ip6_gre.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index 3333a0ab180c..ba080a58ecb2 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -681,10 +681,10 @@ static int prepare_ip6gre_xmit_ipv6(struct sk_buff *skb,
 	return 0;
 }
 
-static int prepare_ip6gre_xmit_other(struct sk_buff *skb,
-				     struct net_device *dev,
-				     struct flowi6 *fl6, __u8 *dsfield,
-				     int *encap_limit)
+static void prepare_ip6gre_xmit_other(struct sk_buff *skb,
+				      struct net_device *dev,
+				      struct flowi6 *fl6, __u8 *dsfield,
+				      int *encap_limit)
 {
 	struct ip6_tnl *t = netdev_priv(dev);
 
@@ -704,8 +704,6 @@ static int prepare_ip6gre_xmit_other(struct sk_buff *skb,
 		fl6->flowi6_mark = t->parms.fwmark;
 
 	fl6->flowi6_uid = sock_net_uid(dev_net(dev), NULL);
-
-	return 0;
 }
 
 static struct ip_tunnel_info *skb_tunnel_info_txcheck(struct sk_buff *skb)
@@ -866,9 +864,9 @@ static int ip6gre_xmit_other(struct sk_buff *skb, struct net_device *dev)
 	__u32 mtu;
 	int err;
 
-	if (!t->parms.collect_md &&
-	    prepare_ip6gre_xmit_other(skb, dev, &fl6, &dsfield, &encap_limit))
-		return -1;
+	if (!t->parms.collect_md)
+		prepare_ip6gre_xmit_other(skb, dev, &fl6,
+					  &dsfield, &encap_limit);
 
 	err = gre_handle_offloads(skb, test_bit(IP_TUNNEL_CSUM_BIT,
 						t->parms.o_flags));
-- 
2.47.3

