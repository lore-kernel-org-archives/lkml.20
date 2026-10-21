Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792565750;
	b=hHxb4E6YUS+mNOEf/DA40aiLOrGSKA2ic9lIxCF+BA4t0HMXgmzP5wDIov8JJCWHqhdy
	 gy5GmIeMou77xGI6aMOElTpQYJKpDNMk8H+eCtEKKtF+bqOH62CQGLCPFQjlOIip2Kz5q
	 NFoQSgizreQglOzIgKmyDDcAk0uCXEAZcTE8TaXxQ6s6Qx6hnKy/CAwVWTQ575V+0Kqs8
	 BECc16GCevTGa0ZfOJpp/3lGf0AtUzj9wKtB7GAqZw393M1yeE3Cp9bbL2090YOzPnjIx
	 KWVFO7SUbfbl4C7r1ZmMWrp62HJjLyISHBKVGbOCjVywea7sHWKeH1TYsh2OdGy2plA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V+R4YF/y9X5+PnJYN2y3x8HJLwi28vjcGLuJXKxuZzw=;
	b=Qig0I7Hxs+oD0IVboMaTczLCBDoCl7mni33Ccs1FGlro31majBqPVgcJ/xuQUpkvw9T/
	 UFgg/CADQUpYxTCC0a+mKAAjv3YUlVlsYUtcIbRPA1G8VmloA5PQ4Ywax/+KyU8ZK0Kw5
	 rP7cSLqetVsI/m54Zj5CGY6wWshmUoHVSc8yeT04rGTbRUAnxtVHZFt62jUQXa+LzqJdk
	 dYrZ6jlxDx0T91cSOUGb5eTcWd7otELX6EWRCSe6hYHet3+AYc6xhYBDx67dYhKP4RP5z
	 32VXKHnO8+YPzC/flr4g3YXD093hWeppyCaTswwNpFRIPY5HAHsZmDHp32tKnR5DbWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CvvqXYrV;
	arc=none smtp.remote-ip=209.85.208.47
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9533606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9533606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CvvqXYrV
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so486069a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792565748; x=1793170548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V+R4YF/y9X5+PnJYN2y3x8HJLwi28vjcGLuJXKxuZzw=;
        b=CvvqXYrVhzzPQkSFPnwn0++FTGgQkvh80qkMneWETr+RUvhHd8xfNiO0gZOIA3UkB4
         /HU53j2ToGqS7ek2++CHZl7FxkmR0lNPLtFSwQfwLT9+eP/f0gAVXAuaxeJKD5B8eyph
         81gV80/1gvzU3UbsJbbpAo7UfuHKPJGxU2G0JYdeeSYHJZlZp+iRNoN4b9fvkdT5LTEC
         ROAZJdxeieGTPYAxhtcIP/hzIetVpY2czlf8aTHdw5csogJNsPh2JZadvxopL2JiGc4v
         PGqWi/GbRS2w8S7/jgBNyaCL/DidZamOmTuf4slpO9+K0i2I5tvZ1y4dlWeEgea1blhz
         k7Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565748; x=1793170548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V+R4YF/y9X5+PnJYN2y3x8HJLwi28vjcGLuJXKxuZzw=;
        b=xhqmewl8gjvtnsq2obOD9YQHZdOPfj/1fOkHa0743xSoS1XdqgWkezbV0+c2LRb/ai
         vcJkCRwYFl0U59ishfqTS1gV4wW0ISl+/wMmit+HiGl7Kzp66DLUzuSd3/EwIRbGXbZn
         uH9tPP0aX+uFE6BcmNBsus8yESlxqEKou6ZO+L09SUH17MNrD3nbfsNph2jRvjC2sILc
         0UNKBKzSNzlN/adz/2MuuDcUQhaaBHpwz+VynDhnWDiNXEctAJIIihoxr1Gz7dnUJ1Qk
         9Z6P9PpxjLfBcGMY9+r2SWjxOIdxuHwKsX+imegkMtuK2Mo8x/4mlpYbhFFQsQjvhgxo
         V9ig==
X-Forwarded-Encrypted: i=1; AKwUvBz4r3OGDc8SgFI4yC3mZVAKwFm/Uawr0G0t2IrKvB56yqzSmj90FRmzq80L/Z8akLjPKUEiSSrhNyWSWJ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKHOsQPEfkYbmCFMqp42whFGMsf6b6lz0ALcx+sFZZ6QSdrjEI
	CSungv4DUi3cnwclWBL2W/4L12Q7XlnYl64VbReOo/6OFionyP4xfV2T
X-Gm-Gg: AYBFou20cdIdZvlg7aGXr4e9MICj2c0oFP0p3Yys0GsTM3/iXUUbJj7LN94gys+h0RQ
	JFhKi4jhd1aI2VJHqH/z/ZKjilackB8tMheShHJWlJGyGWWn7ht+mZa7vT9XoBZUjl7Je3RI03S
	HS3mrsvEcBWBi1kMHT/f+PmM5+ZXKsj/EPZL6frH0A/QzqbEHZyEfpdYllasuIp4BKJ6ICYcZIU
	Dy1tuIRUBT2/XG9bXOp6+i2rsAf+f+SW8p8oAD7K/zVq2BcXX6cq4DSEGF3BrS55zYlAONMjm5k
	6rWziowDyT5CZywGtyhQS8AgY0gfCXpchayYPMd4Ql07Y7JehCTqjZ0Rk4kX37r8fede0ViPXnV
	y36cZAP5yXQSFNnfkprUnx3fE2l7GTCHrJcaNj4ClDUHk06WaRw7hK0/jY4L8MPDbvbiXUxl5lL
	supWp80boTjjle5TPt6NtCKH3DPgM2sT7vm/lFUtlLyKTHPge3n7hSiScrrfc3nX24qOgmETt6P
	Yy0UMvKf3ZtqumMiIx07DWTHxZ1aB02uyDAlCbutrCxkcVxxw4fcIZyI5ii/82KLfbp7WvEuc1c
	Dnl7N4wpVy2T
X-Received: by 2002:a05:6402:52d3:b0:6b1:d2d6:4013 with SMTP id 4fb4d7f45d1cf-6b408eb8292mr521517a12.17.1792565747740;
        Tue, 20 Oct 2026 23:55:47 -0700 (PDT)
Received: from theodors-laptop.. ([5.255.118.7])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b402f2b8f9sm543690a12.3.2026.10.20.23.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 23:55:47 -0700 (PDT)
From: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Chengfeng Ye <nicoyip.dev@gmail.com>,
	stable@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
Subject: [PATCH net v2] fou: reserve headroom before pushing the encap header
Date: Wed, 21 Oct 2026 14:55:17 +0800
Message-Id: <20261021065517.198322-1-theodorlarionov@gmail.com>
X-Mailer: git-send-email 2.34.1
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

ip_tunnel_xmit() and ip_md_tunnel_xmit() call ip_tunnel_encap() before
reserving headroom. A packet redirected into the tunnel (tc mirred, nft
fwd) has only the headroom of its original device, so fou_build_udp()
hits skb_under_panic(); with a mirred mirror the push overwrites the
Ethernet header of the original packet.

Reserve the headroom in fou_build_header() and gue_build_header(). GUE
sizes and builds the header from one copy of the encap config, which
can change concurrently. As the skb head may move, ip_tunnel_xmit() and
ip_md_tunnel_xmit() reload inner_iph after ip_tunnel_encap(), and
ip_tunnel_xmit() reads tnl_params before it: for GRE with header_ops,
tnl_params points into the head.

Fixes: 56328486539d ("net: Changes to ip_tunnel to support foo-over-udp encapsulation")
Fixes: ac931d4cdec3 ("ipip,ip_tunnel,sit: Add FOU support for externally controlled ipip devices")
Cc: stable@vger.kernel.org
Signed-off-by: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
---
v2: move the headroom reservation into {fou,gue}_build_header(), reload
inner_iph after ip_tunnel_encap() and read tnl_params before it, which
the Sashiko review of v1 pointed out.
v1: https://lore.kernel.org/netdev/20261010223601.1193655-1-theodorlarionov@gmail.com/

Chengfeng Ye posted an earlier series for this bug; this takes the
builder approach Paolo suggested.
Link: https://lore.kernel.org/netdev/20260904165544.1362052-1-nicoyip.dev@gmail.com/

 net/ipv4/fou_core.c  | 15 +++++++++++----
 net/ipv4/ip_tunnel.c |  6 ++++--
 2 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/net/ipv4/fou_core.c b/net/ipv4/fou_core.c
index 076fdca44f51..896e63adf698 100644
--- a/net/ipv4/fou_core.c
+++ b/net/ipv4/fou_core.c
@@ -1059,6 +1059,9 @@ static int fou_build_header(struct sk_buff *skb, struct ip_tunnel_encap *e,
 	__be16 sport;
 	int err;
 
+	if (skb_cow_head(skb, fou_encap_hlen(e)))
+		return -ENOMEM;
+
 	err = __fou_build_header(skb, e, protocol, &sport, type);
 	if (err)
 		return err;
@@ -1071,16 +1074,20 @@ static int fou_build_header(struct sk_buff *skb, struct ip_tunnel_encap *e,
 static int gue_build_header(struct sk_buff *skb, struct ip_tunnel_encap *e,
 			    u8 *protocol, struct flowi4 *fl4)
 {
-	int type = e->flags & TUNNEL_ENCAP_FLAG_CSUM ? SKB_GSO_UDP_TUNNEL_CSUM :
-						       SKB_GSO_UDP_TUNNEL;
+	struct ip_tunnel_encap encap = READ_ONCE(*e);
+	int type = encap.flags & TUNNEL_ENCAP_FLAG_CSUM ?
+		   SKB_GSO_UDP_TUNNEL_CSUM : SKB_GSO_UDP_TUNNEL;
 	__be16 sport;
 	int err;
 
-	err = __gue_build_header(skb, e, protocol, &sport, type);
+	if (skb_cow_head(skb, gue_encap_hlen(&encap)))
+		return -ENOMEM;
+
+	err = __gue_build_header(skb, &encap, protocol, &sport, type);
 	if (err)
 		return err;
 
-	fou_build_udp(skb, e, fl4, protocol, sport);
+	fou_build_udp(skb, &encap, fl4, protocol, sport);
 
 	return 0;
 }
diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index e6bcf01411d0..742c2b309608 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -606,6 +606,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 	if (ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4) < 0)
 		goto tx_error;
+	inner_iph = (const struct iphdr *)skb_inner_network_header(skb);
 
 	use_cache = ip_tunnel_dst_cache_usable(skb, tun_info);
 	if (use_cache)
@@ -749,6 +750,8 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	}
 
 	tos = tnl_params->tos;
+	df = tnl_params->frag_off;
+	ttl = tnl_params->ttl;
 	if (tos & 0x1) {
 		tos &= ~0x1;
 		if (payload_protocol == htons(ETH_P_IP)) {
@@ -767,6 +770,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 
 	if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4) < 0)
 		goto tx_error;
+	inner_iph = (const struct iphdr *)skb_inner_network_header(skb);
 
 	if (connected && md) {
 		use_cache = ip_tunnel_dst_cache_usable(skb, tun_info);
@@ -799,7 +803,6 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 		goto tx_error;
 	}
 
-	df = tnl_params->frag_off;
 	if (payload_protocol == htons(ETH_P_IP) && !tunnel->ignore_df)
 		df |= (inner_iph->frag_off & htons(IP_DF));
 
@@ -821,7 +824,6 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_device *dev,
 	}
 
 	tos = ip_tunnel_ecn_encap(tos, inner_iph, skb);
-	ttl = tnl_params->ttl;
 	if (ttl == 0) {
 		if (payload_protocol == htons(ETH_P_IP))
 			ttl = inner_iph->ttl;
-- 
2.34.1

