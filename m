Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C4F5293E2
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 22:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790115330; cv=none; b=Qaji+GRRVk5cT/T0jx4EnSWUT/h4G32QPewyiVIKiAkN0xXnnoCXmd4+z7OBMjcBBo8aTBp0l2udIiHCIpEMZ1AusivKt/4utb46+87lxOVDbD+9vThqwVc0Wp7Il6O0e4p+msDbjgZZCz4cd8G0e5BaVUDqjpCUC4znWQjfz6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790115330; c=relaxed/simple;
	bh=lDaeQywAkd0uBlKk3oiOi1EGJ4dlkQdf6ygCCL5j95k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kONadbhdemlF2HGZZNtcw9ZV1kixv0q5luvNdxkFwF8c5xj3kGbwjnTQFYDVAaPKf5eKFgtdsuLFK6mg4Jvxwb5EOiz7708k5mpFhCVUT9F/PTOxil73uyalwJt1dW89qddfHzClOBiWXYSHQwsGYHYGKdqe3JC9iTJYSs0vcxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ae7udJzt; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ae7udJzt"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8c3de61a3so243598e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790115318; x=1790720118; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bP3J1wrqvElmNl+E95+ncUWTRk8fLaOH2UYEkTJtxjc=;
        b=Ae7udJztTjNsdkZoBV4vPVXSzfwa00JnuqFLc+e5Z3XSLMLmLF+ANGavlC7ANVuTq/
         r3cadkB1CIngRLAVaJARp05b/vhT4fd3Tv5uN2DmgXYN2XJTZzsKVVd3sdEm3hJx0Thb
         n6UzaEUDQ/LhlKdT/SZ2s5LwSCtkY+LFjC/IVPK1Jdvm6nNwfUKivYGi/avtIYLFKktG
         KsZQ7l4ZLqjLEcp0GDUQ893Hl5C9MSTBsxl5vTtyCuusKxTbfPdu1765u2yIjUuiMKfH
         kZbhG7HjTO42qbOzJZI1pd0IcsO/DztpslE2/WGOD+7QN7WVKRMmGLh0Nrzb45/0fh46
         CFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790115318; x=1790720118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bP3J1wrqvElmNl+E95+ncUWTRk8fLaOH2UYEkTJtxjc=;
        b=ldUx63Ejph5ymI6upU0T59xbn1+vZhiAPeC/M2VkyP0YygAEo7bxuymK7xrMRLZY2Q
         yRWwCSgLoEqtc9VfV7tyTusgo+eyDu6o0GOwxFdIWwVRFhJYMjZcgdSEQbjE0YrCe3EQ
         8xk0SaIsMQ9FWuiZUnOZw9AHt70mZVulahnWelREY4859CbK4902GlSf/MJkNAt6DO7T
         lD1yqCAbIBfM3p320ZvcvKUDYIqwbV/hwLgCcCnSxW+jS6H/alwB9oE9Iy0cqoYvL1NR
         2Vr/2s/jKzjZis8jYInJS9nHeVDst91Jq+1mbZImD8M9/5N4hdGCB+/d8I66IQ04SWRp
         wLaQ==
X-Forwarded-Encrypted: i=1; AKwUvByhZgCyhGsxYkBkF0CC+5KueDxaq4yypiyOpTj3ZzTb6UwSXxWzVQLpDtCKhVJd08bgqQ67Tfr4fZrBKZ8=@vger.kernel.org
X-Gm-Message-State: AFuF++mlmQ78N5Kz+JBEg+1qaULCjiKf2OdHT5lCXnvoQtGVmUGsUixZ
	Jjxu7xyugczN/yZH6Q+RKjV6AGPxFlWvPyyoo54kown2TmDrctUUpdM8
X-Gm-Gg: AYBFou2Spl+RRzZKxO9X4EI8I+QILkdqbhYi4XLE1YByKUUfKqRQxisjw89/gI7e7Fe
	5QTtF6Jd9RUBFqEGcX1s8VTMJmGWK/P8Lg4iCANMAC4ElHMbLI9+e8rPHp5nnkfe7BOEwMX6OJ+
	q36e6mvkeHMtjvmbQvuSjDv/4iKKBTY16nIG22vT0NmsiGgvTagSaOaN0o8W+sQnYU/qOxNIvjz
	XPMvXP5a/4aqtvs0S0wDviQUHh/7zv4VVqdP6MKtgoKkSJKn0TRWxS7L5PCtXaUIvnGpmic5K9B
	1I/nvkv0WDxpQmnlC4ETA3CK0F5pnfqmHvD2yfb1YvsYXG0wtXzX1vpFhRJYx2nCr0NkwhoJ5v0
	zVEuzPv6pwT9+fgLE8VwrpaPS+oZPfJAvGqAvHehw1sWQoWiXO+2fhFt+yosIJ4fNlZv7DCJd5W
	qpdYWDCRm5XMleEicP1CbcYDgxCQLN//vmBlIPeOKBbQo7ePB0zrxxyjXUlRgwAh1iDfDKDkRKN
	J7CXxkWTdcJx6lMqR6vrlrFlK59AddZYmUpFbv4sUqF7s7GBO2h/msQUmQtLFkGx929ASrX
X-Received: by 2002:a05:6512:318c:b0:5b4:fdbe:ab4e with SMTP id 2adb3069b0e04-5b8d895e710mr201829e87.25.1790115317953;
        Tue, 22 Sep 2026 15:15:17 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([94.28.220.48])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d857873asm164920e87.17.2026.09.22.15.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 15:15:17 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v4 02/10] ip6_tunnel: add drop reasons to the generic RX path
Date: Wed, 23 Sep 2026 01:14:59 +0300
Message-ID: <20260922221507.3268127-3-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922221507.3268127-1-littlesmilingcloud@gmail.com>
References: <20260922221507.3268127-1-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 net/ipv6/ip6_tunnel.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/net/ipv6/ip6_tunnel.c b/net/ipv6/ip6_tunnel.c
index d5ff50a2ac01..458ce328311b 100644
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
+		reason = SKB_DROP_REASON_TNL_OPT_MISMATCH;
 		goto drop;
 	}
 
 	if (test_bit(IP_TUNNEL_SEQ_BIT, tunnel->parms.i_flags)) {
-		if (!test_bit(IP_TUNNEL_SEQ_BIT, tpi->flags) ||
-		    (tunnel->i_seqno &&
-		     (s32)(ntohl(tpi->seq) - tunnel->i_seqno) < 0)) {
+		if (!test_bit(IP_TUNNEL_SEQ_BIT, tpi->flags)) {
 			DEV_STATS_INC(tunnel->dev, rx_fifo_errors);
 			DEV_STATS_INC(tunnel->dev, rx_errors);
+			reason = SKB_DROP_REASON_TNL_OPT_MISMATCH;
+			goto drop;
+		}
+		if (tunnel->i_seqno &&
+		    (s32)(ntohl(tpi->seq) - tunnel->i_seqno) < 0) {
+			DEV_STATS_INC(tunnel->dev, rx_fifo_errors);
+			DEV_STATS_INC(tunnel->dev, rx_errors);
+			reason = SKB_DROP_REASON_TNL_OLD_SEQ;
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
 
-- 
2.47.3

