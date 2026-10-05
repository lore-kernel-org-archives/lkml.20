Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6384DD3B2
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231270; cv=none; b=bv2A5aHdVvpq6fMT1yxQJieJnMQc8vkxnKFY0nR+a45zMslLv1z2sb/ebJPEn2GogZ/pd4+T/UkfDAJbqqrZXCuSl437vhVqdDMy+xiES/+XSuAGMBmcGEyE3IJXp1fe1cGqTzVmEGtprfRpnkDkHFRP0DdgGOXPz5dbEf6JZFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231270; c=relaxed/simple;
	bh=gXkvSw+9QQgisWh/HWmMh0ugfeaaEQBVg9UZBlI8UV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RIkfKy1K5vSNLcI22rgVk020PPbR7Vaqrdowan9xzwgUxtl4/Tlok8GsGXTIx5OtoI2MVXl1DlsjxyjxEYQeUq6fcpxrCg5iYtYdaeaERedg2W+BWUMd4IdJfwrKqpxbjhCQev1YqvATytfhGcSSPg9Qo/2JRuh3Mjr9bzADLyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VA7M7Xuo; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VA7M7Xuo"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a20f06cce6so3437841fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791231266; x=1791836066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SjKM/2PlLM7NfwMHmGxh80vAWnG0bVq6zdDZ+uQWDAM=;
        b=VA7M7XuowpiKxYtmmhrwJ6VWNrLwnDnVwCT3Xs6ClMWJ1xjQYIkrMyKUC1HmeL7KJU
         BWAvSuOv2ES9sG8ayI/dM3zKv6C7n+sV/az32xOjvxaL8lUXTzyK9e29ji70sZ6MVNDW
         t5JFllnCoDOHIGet6WhW6J/hlmovVJGRBsGPsZx9SuR9iToY3JzGSrC4wjDwP/BLNaqE
         FK9Twqq2WwTNZ3bz9VlOyTLxmoVI4+wSxqlW6ggqHdWXUYP6NoEY9XFAdwTF/YpQktD7
         381gAGjSQIkggv9LYGOEBN9C9jdzorU1hVOFPLioaYz7C/bM3KNZpEt9CRj8NNXZDuzj
         nKXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231266; x=1791836066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SjKM/2PlLM7NfwMHmGxh80vAWnG0bVq6zdDZ+uQWDAM=;
        b=lwJ+1+YIxrmB5yTIFLP0y1R0Cj0HcPEiarzf7pgo1zu8OrjHvbcMOru4GWIM+6Qo8K
         cJf2oB4n9MgV+Kx+dmA/YptFG0zFxn/w4gxx0+pQv0puNrFVy210vn9ntPNh3xmDZX2v
         3gORkNkQ/KicU+3gHmZa//Kmxm3oMFKMy2GOX5Y5toHbmShiLpFmgtN6/k6wIToId4nK
         XlzRoVwZpfpWvMm7EY6Sp8yr6xBsHe8Cxui8KBjtSHzkZmquXT+Z8WBm+hapo64NxuFU
         uz1N6fRAFbI1Vbhr+Q26BZim9KZP7J3AXhw6UFfiDemKoJpGhjMWNFloV5GK2ujo8FFQ
         yrig==
X-Forwarded-Encrypted: i=1; AKwUvBzF+seYoHUlmVnNqgXmUuSTPYFp64P73H1ZZHZ27SIz79eM3cUXHGV8r2YRpieOwJP2tpkTLsR+DuMrepw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJF1AmRtm95VtZIs/dhrwyA93jVwcSsl1hLZbhSZEJDqxX4S218
	0KVPE/dU1GdE+Oiq1VEO3+4GArmYNwdgfH7qIQQlRDBswHkCsb8P0Hb6
X-Gm-Gg: AYBFou1lPwPMnoaeJ13r5Bpm6cnXRMQeghn6uQjp19/Lz2nS/HP29S0abcWV7rthZQu
	81c+3q+rwNY73b8qBEbIxulF4Y4S346KRTMdHZ4yFnxsRUYlDEZw5cosMWDbrqXgRvWV26DWvq5
	9UIi4ebYkLd43mWObA2CeQgOK3L19PTWrRvRxQw0DjtoA7v7QQ8Sy8JJnoEs+tfGvmeSaUtxw53
	xG8HXVN0+kb16uTu9Fr6KfXTDYmWYX4EwVUK6zDRi2l52Q4hRjcCiSQw23YpPmRUAh3rFHBR72L
	zXZCnlFOtLR9YLWyNWCF3cpWgYkO0EaACJSwcohK1bleiLS+ZCD97yHL4jKLZEvFQdxKeBmPkWj
	nXroiTFr1XPUTBxLZVdYFj3Wa04Y+JyJ7A92ALce+oevdNjTbA9zzBKxfxszdJ4rUzHLYW0eZNa
	pjFq/aH6S3Rif/CpAnSBVenzigRmI+3VYPktch+dvYFPQHfnIoeZABv66C46s85a2ad68UqkR0c
	EGKUyjRDFrhNEQV98VZD5zCD8wUoEAQVDkYoWGuDw==
X-Received: by 2002:a05:651c:3451:b0:3a7:7277:3ec0 with SMTP id 38308e7fff4ca-3a99431d252mr1550811fa.16.1791231266154;
        Mon, 05 Oct 2026 13:14:26 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.161.1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303889sm43114681fa.20.2026.10.05.13.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:14:25 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/4] ip_tunnel: make __iptunnel_pull_header() return a drop reason
Date: Mon,  5 Oct 2026 23:14:15 +0300
Message-ID: <20261005201417.906344-3-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261005201417.906344-1-littlesmilingcloud@gmail.com>
References: <20261005201417.906344-1-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__iptunnel_pull_header() returns -ENOMEM whenever it fails. It can
fail in two pskb_may_pull() calls, one for the tunnel header and one
for the inner Ethernet header of ETH_P_TEB, and in the skb_unclone()
done for GSO packets. pskb_may_pull() fails when the packet is shorter
than the requested length as well as when pulling from the frags cannot
allocate, so a truncated packet and an allocation failure look the same
to the callers. The ones that report a drop reason can only pick
SKB_DROP_REASON_NOMEM, as vxlan_rcv() does, and so would the GRE
receive paths once they report drop reasons. In ip6_gre, gre_rcv()
pulls the header before the tunnel lookup, so a packet from any sender
whose ETH_P_TEB inner Ethernet header or WCCPv2 extra word is cut short
would be reported as an out of memory condition.

Make __iptunnel_pull_header() and iptunnel_pull_header() return the
reason pskb_may_pull_reason() already computes, SKB_DROP_REASON_NOMEM
when skb_unclone() fails, and SKB_NOT_DROPPED_YET on success. A failure
is still non-zero, so the callers that only test the result keep
working. Three callers, in ip_gre and ip6_gre, test it with "< 0"
instead; the enum has no negative values, so that test would always be
false, and the compiler does not warn about it. Make them test for a
non-zero value. vxlan_rcv() keeps reporting NOMEM for any failure until
the next patch has it report the returned reason.

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Assisted-by: LLM
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 include/net/ip_tunnels.h  | 10 ++++++----
 net/ipv4/ip_gre.c         |  4 ++--
 net/ipv4/ip_tunnel_core.c | 22 +++++++++++++++-------
 net/ipv6/ip6_gre.c        |  2 +-
 4 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/include/net/ip_tunnels.h b/include/net/ip_tunnels.h
index 7102aa11fae2..5cccf4c0e691 100644
--- a/include/net/ip_tunnels.h
+++ b/include/net/ip_tunnels.h
@@ -614,11 +614,13 @@ static inline u8 ip_tunnel_ecn_encap(u8 tos, const struct iphdr *iph,
 	return INET_ECN_encapsulate(tos, inner);
 }
 
-int __iptunnel_pull_header(struct sk_buff *skb, int hdr_len,
-			   __be16 inner_proto, bool raw_proto, bool xnet);
+enum skb_drop_reason
+__iptunnel_pull_header(struct sk_buff *skb, int hdr_len,
+		       __be16 inner_proto, bool raw_proto, bool xnet);
 
-static inline int iptunnel_pull_header(struct sk_buff *skb, int hdr_len,
-				       __be16 inner_proto, bool xnet)
+static inline enum skb_drop_reason
+iptunnel_pull_header(struct sk_buff *skb, int hdr_len,
+		     __be16 inner_proto, bool xnet)
 {
 	return __iptunnel_pull_header(skb, hdr_len, inner_proto, false, xnet);
 }
diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index 51fcd603939c..3ee437fa3eae 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -312,7 +312,7 @@ static int erspan_rcv(struct sk_buff *skb, struct tnl_ptk_info *tpi,
 		if (__iptunnel_pull_header(skb,
 					   len,
 					   htons(ETH_P_TEB),
-					   false, false) < 0)
+					   false, false))
 			goto drop;
 
 		if (tunnel->collect_md) {
@@ -378,7 +378,7 @@ static int __ipgre_rcv(struct sk_buff *skb, const struct tnl_ptk_info *tpi,
 		const struct iphdr *tnl_params;
 
 		if (__iptunnel_pull_header(skb, hdr_len, tpi->proto,
-					   raw_proto, false) < 0)
+					   raw_proto, false))
 			goto drop;
 
 		/* Special case for ipgre_header_parse(), which expects the
diff --git a/net/ipv4/ip_tunnel_core.c b/net/ipv4/ip_tunnel_core.c
index bab42b9e277f..6c2855adff28 100644
--- a/net/ipv4/ip_tunnel_core.c
+++ b/net/ipv4/ip_tunnel_core.c
@@ -106,19 +106,24 @@ void iptunnel_xmit(struct sock *sk, struct rtable *rt, struct sk_buff *skb,
 }
 EXPORT_SYMBOL_GPL(iptunnel_xmit);
 
-int __iptunnel_pull_header(struct sk_buff *skb, int hdr_len,
-			   __be16 inner_proto, bool raw_proto, bool xnet)
+enum skb_drop_reason
+__iptunnel_pull_header(struct sk_buff *skb, int hdr_len,
+		       __be16 inner_proto, bool raw_proto, bool xnet)
 {
-	if (unlikely(!pskb_may_pull(skb, hdr_len)))
-		return -ENOMEM;
+	enum skb_drop_reason reason;
+
+	reason = pskb_may_pull_reason(skb, hdr_len);
+	if (unlikely(reason))
+		return reason;
 
 	skb_pull_rcsum(skb, hdr_len);
 
 	if (!raw_proto && inner_proto == htons(ETH_P_TEB)) {
 		struct ethhdr *eh;
 
-		if (unlikely(!pskb_may_pull(skb, ETH_HLEN)))
-			return -ENOMEM;
+		reason = pskb_may_pull_reason(skb, ETH_HLEN);
+		if (unlikely(reason))
+			return reason;
 
 		eh = (struct ethhdr *)skb->data;
 		if (likely(eth_proto_is_802_3(eh->h_proto)))
@@ -135,7 +140,10 @@ int __iptunnel_pull_header(struct sk_buff *skb, int hdr_len,
 	skb_set_queue_mapping(skb, 0);
 	skb_scrub_packet(skb, xnet);
 
-	return iptunnel_pull_offloads(skb);
+	if (unlikely(iptunnel_pull_offloads(skb)))
+		return SKB_DROP_REASON_NOMEM;
+
+	return SKB_NOT_DROPPED_YET;
 }
 EXPORT_SYMBOL_GPL(__iptunnel_pull_header);
 
diff --git a/net/ipv6/ip6_gre.c b/net/ipv6/ip6_gre.c
index 258239a7c53b..0392f6ba862b 100644
--- a/net/ipv6/ip6_gre.c
+++ b/net/ipv6/ip6_gre.c
@@ -512,7 +512,7 @@ static int ip6erspan_rcv(struct sk_buff *skb,
 
 		if (__iptunnel_pull_header(skb, len,
 					   htons(ETH_P_TEB),
-					   false, false) < 0)
+					   false, false))
 			return PACKET_REJECT;
 
 		if (tunnel->parms.collect_md) {
-- 
2.47.3

