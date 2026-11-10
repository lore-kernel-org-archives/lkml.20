Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342029;
	b=tlNbDCwz1iVHNhGigxh9qbhlCozLRRZYe/yOZQlN+sZNS4Um/REe1Zd71CRUXi4bwEnj
	 fJ3DOlJoJ2KLJxV7awkew1C8U3MQ/hnuzq93L/1eFjyXIJ4h9BbMr6OGHCPtPM90xhWwm
	 8kytPMnka7i0k36JKAmn4JwHsqCX/EHX0rrfvKkG/4ovzTipWzu5NcAKS0d4SHBq/9y+w
	 M//ox68TtrWZPMAV0BjHxwUnzykJUcQ+e5GbEn2D8XCvxoC5S24spOjJ0yFFe9EeBTpHE
	 Xv/mlSJVC0UgdNHSlhAIUunDCq8/i9c4jYch7xG31B5FS2bZY10t9XrU26K5oj0B3aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OjX+JgGI9jrtFpn+OcL7vKv0wFa1o1cDzJbV4ITeB+w=;
	b=Fzuwjk8QcBWnNAEct+T0ZKS89Br7t2M2OlxCPs65P+oBAAxl8zMOKvZxK64mFLc7j62s
	 VOZ/e2DW+gVV79Atfkk5gsQxQ35Ke17EN/YG8uea4E9PGk2CDN+OuC1JWBNzUhxSKZPGP
	 PxoVBR6bsB4dNKzc1k/B4lIqbxDi3xlNHmde2sFGNakxTGzWHXWKnvVLJZVBoe1h0ijdy
	 gSHKnrhaVOMd00B0bWLLDr8GBbYFYYFztqLyBtwZRHX7ndmZcnv7EJ82BI8+Y07I0E4MC
	 gxDID4sEIuxl614S96u6pv71Onv1tRyxFD4AFHfkHbqU2CkXK868iZOQesej8Nfwt6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wpi55hwY;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1905B60A2603
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:20:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1905B60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wpi55hwY
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3a1f628b1d1so19509641fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342027; x=1794946827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OjX+JgGI9jrtFpn+OcL7vKv0wFa1o1cDzJbV4ITeB+w=;
        b=Wpi55hwYcu76C7VKSKAeE0QeMC4jJkiemQow4tiGQMVUYuZLV+zV8d3N8/nhHkS/Tx
         zC8CrOTHwh/zSOIMov5PQb30OdJ+/qNfwN2sI39Yafp4+ZLUE+TBc6ugwg91+VA568ea
         GSCEcjdHVRiDoUohkerMnu/pZkkhPGDPgfYFQWpx1k4PSYBHe5xzUbFE82ga/sqLdVSC
         MJIDb8PssEGNpy46/aoO4Fdmj5G+YkiSK/Uo+ngMznEjn8AnlLacubC8P3Q8p2Vm/GGP
         ifnP5i4CIVcBqnRNLalKnSTGVEoRzhpUHLDnZE6nOt/Yn9Loc+p0kGoW+xtfjAU5Wcwq
         1UMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342027; x=1794946827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OjX+JgGI9jrtFpn+OcL7vKv0wFa1o1cDzJbV4ITeB+w=;
        b=WughS+BqjvrU+tha1LrODk9fghkSkxBWUHrHGufvsA5XmG83ikFC0swodSEGW/fS7C
         49lXt2X2ZROMe+mlzSZpbGxtTY0csgB/xY7fazza9FatePVMhW7P5NZEEQ6SvKRFH2qU
         gJ7hzc1+EX0pNao0a4FPFhKUrUgThySL1gjrbGF7siNEVZD9Hw6bpRvJuVDOeLmDMXmA
         TESe0Upblg6mQe0FRnZUrNwuqqTVuRalqEz48gxSHSQqwNS1L03hE2Gi3HFzD7bDAGIu
         HoNE5ooNg4ZUFVH8iZcPGOtT8aOTCHK+NxckdrSU8VI8K0Moesr9lq8ML5Mz+XjXVlAu
         YmvQ==
X-Forwarded-Encrypted: i=1; AL+hErE96vKculJ4HqymcjVZIAr4xS0NNhhe/4SSpgiYHFTmDzxtajUbx/tKX7HqyUOSLChcQ+o5hDMXfH/JWyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Odlhgng8GltRFJ4PE3MZttdW0sxYPG38AVEHy6zUOWGkaEHIR
	eEq9Kg7ApqdKzexNGwKLKmeJ3lrIX+fnSDyNjkMSIJEp09rd9Q6ouN4O
X-Gm-Gg: AYBFou0x6thhiFRNZ8TvAYGN1kkUG6jbNOm3G6UL6wuQih2exPRONjEgs2cid5vWAFQ
	AorguSXybLTRlsFaie3RwKkVpUM+p4hW/E2KsQR0lWh5v2ackDwKXwwzVgac39z81NyXncvSyBu
	7Cktw53VDvw1dMZqRhq8cjO0pIdaVPFNKtVDI2FwAhh5wh0LoSWIeQcBVRimJiVnPkotHC1ikyz
	VJY8r/4YoE+yRiYcS3wZVjAO5Z4aUZHUtfykuuXtJMYFHbGt4ZsY+tS4eo46Yf49+remMFXFsct
	Dsh4/T4p8NFQQYC94IBqFdogtQT5lZSehWxB9qsmVMOPrO4RKF6YYxz4VgRkyqIDiDQOnsbiXgK
	Sao0KEBBVxoZJXfpIwz4+pfzTWINY4jF4hDYJTAzw8vS8qdc7CffcNsp8H5CsNb8vj6+nMV+MSQ
	JYagdk3GGy8gwH71WHOUKMOLZLBGlUES47bMxiGi1BImKSARbE+bzkHsuHYsltlEquj5NzW0Qp8
	kMfz5nZB5XYOiyHAj+jizVQd/SKQyqe2qVTE2sWRojmxP8TyYrDLPplmsmLqnBbSaCB20XZxwoS
	a9SnBh5mAhNi8YndjFqQJNs/umsgMP61mhQMiMhiONnK5BqZSv4oKPKHuL/B8+ZxXVgHJVB0Ses
	myihbNbkOYXZtPzUR
X-Received: by 2002:a05:651c:2108:b0:3ac:f2af:7611 with SMTP id 38308e7fff4ca-3ae0964ac16mr7302771fa.19.1794342027198;
        Tue, 10 Nov 2026 12:20:27 -0800 (PST)
Received: from dau-home-pc.megasoftware.org ([95.139.137.59])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae090ea59esm5945401fa.0.2026.11.10.12.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:20:26 -0800 (PST)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v6 2/8] ip6_tunnel: add drop reasons to the receive path
Date: Tue, 10 Nov 2026 23:20:15 +0300
Message-ID: <20261110202021.821224-3-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110202021.821224-1-littlesmilingcloud@gmail.com>
References: <20261110202021.821224-1-littlesmilingcloud@gmail.com>
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

__ip6_tnl_rcv() mirrors its IPv4 counterpart: all of its failures share
a single plain kfree_skb(). Reuse the drop reasons that ip_tunnel_rcv()
now reports and the ones the length helpers already return.

Note that skb_vlan_inet_prepare() returns an enum skb_drop_reason that
has so far been discarded, and that the ETH_HLEN check gets one by
calling pskb_may_pull_reason() instead of pskb_may_pull().

__ip6_tnl_rcv() is reached two ways: ip6_gre (ip6gre, ip6gretap,
ip6erspan) goes through the exported ip6_tnl_rcv(), while the
ip6_tunnel encapsulations (ip4ip6, ip6ip6, mplsip6) reach it from
ipxip6_rcv(). Only ip6_gre sets the checksum and sequence number bits:
tpi_v4, tpi_v6 and tpi_mpls carry nothing but .proto, and unlike ipip
and sit, ip6_tunnel stores IFLA_IPTUN_FLAGS in parms.flags, not in
parms.i_flags. So the option mismatch and the old sequence reasons are
reachable through ip6_gre alone.

ipxip6_rcv() drops the packets it does not hand to __ip6_tnl_rcv() with
a plain kfree_skb() as well. Give them a reason too:
SKB_DROP_REASON_UNHANDLED_PROTO when the payload is not the one the
tunnel mode carries, SKB_DROP_REASON_XFRM_POLICY when the xfrm policy
check fails, the reason iptunnel_pull_header() returns and
SKB_DROP_REASON_NOMEM when the metadata dst cannot be allocated.

A packet that ip6_tnl_rcv_ctl() refuses stays
SKB_DROP_REASON_NOT_SPECIFIED, now set explicitly. The helper refuses
when the outer destination is not a usable local address, such as a
tentative one, when the outer source belongs to this host, and when the
tunnel cannot receive with the addresses of the packet, and it returns
only 0 or 1. Telling these apart needs ip6_tnl_rcv_ctl() and its
transmit counterpart ip6_tnl_xmit_ctl() to return a reason, which is
left for a follow-up.

ipxip6_rcv() and __ip6_tnl_rcv() follow the rule of ip_tunnel_rcv() for
the reason: it is initialized to SKB_DROP_REASON_NOT_SPECIFIED, and
every jump to the drop label comes with a reason of its own.

Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 net/ipv6/ip6_tunnel.c | 45 +++++++++++++++++++++++++++++++------------
 1 file changed, 33 insertions(+), 12 deletions(-)

diff --git a/net/ipv6/ip6_tunnel.c b/net/ipv6/ip6_tunnel.c
index 64a184bca467..4912b08228a1 100644
--- a/net/ipv6/ip6_tunnel.c
+++ b/net/ipv6/ip6_tunnel.c
@@ -813,6 +813,7 @@ static int __ip6_tnl_rcv(struct ip6_tnl *tunnel, struct sk_buff *skb,
 						struct sk_buff *skb),
 			 bool log_ecn_err)
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	const struct ipv6hdr *ipv6h;
 	int nh, err;
 
@@ -820,15 +821,22 @@ static int __ip6_tnl_rcv(struct ip6_tnl *tunnel, struct sk_buff *skb,
 	    test_bit(IP_TUNNEL_CSUM_BIT, tpi->flags)) {
 		DEV_STATS_INC(tunnel->dev, rx_crc_errors);
 		DEV_STATS_INC(tunnel->dev, rx_errors);
+		reason = SKB_DROP_REASON_TUNNEL_OPT_MISMATCH;
 		goto drop;
 	}
 
 	if (test_bit(IP_TUNNEL_SEQ_BIT, tunnel->parms.i_flags)) {
-		if (!test_bit(IP_TUNNEL_SEQ_BIT, tpi->flags) ||
-		    (tunnel->i_seqno &&
-		     (s32)(ntohl(tpi->seq) - tunnel->i_seqno) < 0)) {
+		if (!test_bit(IP_TUNNEL_SEQ_BIT, tpi->flags)) {
 			DEV_STATS_INC(tunnel->dev, rx_fifo_errors);
 			DEV_STATS_INC(tunnel->dev, rx_errors);
+			reason = SKB_DROP_REASON_TUNNEL_OPT_MISMATCH;
+			goto drop;
+		}
+		if (tunnel->i_seqno &&
+		    (s32)(ntohl(tpi->seq) - tunnel->i_seqno) < 0) {
+			DEV_STATS_INC(tunnel->dev, rx_fifo_errors);
+			DEV_STATS_INC(tunnel->dev, rx_errors);
+			reason = SKB_DROP_REASON_TUNNEL_OLD_SEQ;
 			goto drop;
 		}
 		tunnel->i_seqno = ntohl(tpi->seq) + 1;
@@ -838,7 +846,8 @@ static int __ip6_tnl_rcv(struct ip6_tnl *tunnel, struct sk_buff *skb,
 
 	/* Warning: All skb pointers will be invalidated! */
 	if (tunnel->dev->type == ARPHRD_ETHER) {
-		if (!pskb_may_pull(skb, ETH_HLEN)) {
+		reason = pskb_may_pull_reason(skb, ETH_HLEN);
+		if (reason) {
 			DEV_STATS_INC(tunnel->dev, rx_length_errors);
 			DEV_STATS_INC(tunnel->dev, rx_errors);
 			goto drop;
@@ -859,7 +868,8 @@ static int __ip6_tnl_rcv(struct ip6_tnl *tunnel, struct sk_buff *skb,
 
 	skb_reset_network_header(skb);
 
-	if (skb_vlan_inet_prepare(skb, true)) {
+	reason = skb_vlan_inet_prepare(skb, true);
+	if (reason) {
 		DEV_STATS_INC(tunnel->dev, rx_length_errors);
 		DEV_STATS_INC(tunnel->dev, rx_errors);
 		goto drop;
@@ -881,6 +891,7 @@ static int __ip6_tnl_rcv(struct ip6_tnl *tunnel, struct sk_buff *skb,
 		if (err > 1) {
 			DEV_STATS_INC(tunnel->dev, rx_frame_errors);
 			DEV_STATS_INC(tunnel->dev, rx_errors);
+			reason = SKB_DROP_REASON_IP_TUNNEL_ECN;
 			goto drop;
 		}
 	}
@@ -898,7 +909,7 @@ static int __ip6_tnl_rcv(struct ip6_tnl *tunnel, struct sk_buff *skb,
 drop:
 	if (tun_dst)
 		dst_release((struct dst_entry *)tun_dst);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return 0;
 }
 
@@ -941,6 +952,7 @@ static int ipxip6_rcv(struct sk_buff *skb, u8 ipproto,
 						  const struct ipv6hdr *ipv6h,
 						  struct sk_buff *skb))
 {
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	struct ip6_tnl *t;
 	const struct ipv6hdr *ipv6h = ipv6_hdr(skb);
 	struct metadata_dst *tun_dst = NULL;
@@ -952,21 +964,30 @@ static int ipxip6_rcv(struct sk_buff *skb, u8 ipproto,
 	if (t) {
 		u8 tproto = READ_ONCE(t->parms.proto);
 
-		if (tproto != ipproto && tproto != 0)
+		if (tproto != ipproto && tproto != 0) {
+			reason = SKB_DROP_REASON_UNHANDLED_PROTO;
 			goto drop;
-		if (!xfrm6_policy_check(NULL, XFRM_POLICY_IN, skb))
+		}
+		if (!xfrm6_policy_check(NULL, XFRM_POLICY_IN, skb)) {
+			reason = SKB_DROP_REASON_XFRM_POLICY;
 			goto drop;
+		}
 		ipv6h = ipv6_hdr(skb);
-		if (!ip6_tnl_rcv_ctl(t, &ipv6h->daddr, &ipv6h->saddr))
+		if (!ip6_tnl_rcv_ctl(t, &ipv6h->daddr, &ipv6h->saddr)) {
+			reason = SKB_DROP_REASON_NOT_SPECIFIED;
 			goto drop;
-		if (iptunnel_pull_header(skb, 0, tpi->proto, false))
+		}
+		reason = iptunnel_pull_header(skb, 0, tpi->proto, false);
+		if (reason)
 			goto drop;
 		if (t->parms.collect_md) {
 			IP_TUNNEL_DECLARE_FLAGS(flags) = { };
 
 			tun_dst = ipv6_tun_rx_dst(skb, flags, 0, 0);
-			if (!tun_dst)
+			if (!tun_dst) {
+				reason = SKB_DROP_REASON_NOMEM;
 				goto drop;
+			}
 		}
 		ret = __ip6_tnl_rcv(t, skb, tpi, tun_dst, dscp_ecn_decapsulate,
 				    log_ecn_error);
@@ -978,7 +999,7 @@ static int ipxip6_rcv(struct sk_buff *skb, u8 ipproto,
 
 drop:
 	rcu_read_unlock();
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return 0;
 }
 
-- 
2.47.3

