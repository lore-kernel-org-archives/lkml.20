Received: from mail-lf2-f13.google.com (mail-lf2-f13.google.com [74.125.229.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA75A51118D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569451; cv=none; b=tbFzdLa618bPA8cQSgfYrup194d2l8oV5Ybq8cFqwG7fbmIBal0xnYHR3pSburPCLyxeHrwohyL/b2yL3SmKOicGCI2Ior4vr+JPhB5RIhHCtXovcSAluC0lRQXUdrSGluhbmzJf+RmYKjJCZdqiUnXr3UK85LzbWxQo4kLdzSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569451; c=relaxed/simple;
	bh=IygfgVwXatJFE+RkNcAXu7MXWyMXCZoruPbUZw0iC9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kEz+nWhIznHNlMTiPBk4qP5qzF2xk55JpNir+43y/R8Em5fKB18t31Q6Gi77Cj8cPp4mWii1g7IX/tZeb/SafTKD8vHkhhf3v+iarq7yXxKOpw8BZhZh1CFhK8CnZTOAe96LSYg5ICWtDayBYN59hIFzaTG4LhqcFg7/2z4swWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBwZiAb1; arc=none smtp.client-ip=74.125.229.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBwZiAb1"
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1744eso953119e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789569448; x=1790174248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M6M76N+fUjJdrgvQgsP7ki/1dRlq0jIuyTjFozFcAyE=;
        b=JBwZiAb1ieOqFMvGx4yDcRQKiILKM4ppU85fNZWfYQi9nC4E1FxSA8RBThRr3DcmC6
         s8+YurnmYPYWG1vssfcVDaeqolWcwvnO+vBKC0Zo+YUKJ1BLUYfQsvmMkeO3caIZ2FE3
         6TAJ3KnK4Rw2vYU+1IGlniywAwiRHkOHnicMHwqLFoGKN6RSWRhxsEvWD9L3U5u1X6Ar
         AGSXfKHxH+6dzUxDPxSUDp5CpsPyCC3cJXAQbeH2lZpEkIyb0LP9K/8x8YqHjQ6WohkO
         1AECqMlcAzucCNQpbOA1cn3wTJX3rLwpIrHLvwaA2d0xfANgCcRefGjqti+xGCbLX578
         OkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569448; x=1790174248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M6M76N+fUjJdrgvQgsP7ki/1dRlq0jIuyTjFozFcAyE=;
        b=ICGFnIxzKFxFvtgx5FSA/lKWmBfhUGLIteKmWCZr4XpsjRdzZ37LSn2mxYqVCHntMA
         wYgvrzWhihANoKAUoMLdc05KwTniny0ApoKWNq3vNZ1BcFdI03uNfs3WE/G7m8KWmJ3H
         6szT8/A1CH+ZQ19O2jYtw7x2CgxnUYc70uQIGa3u6lldFGvTDK8CScj4kITfBpYLauij
         ATcII8RI2JvlLfQtVphXZ6qgWkAgccAdGjUJGEF9bROEvwVjc1d/2QLkQDMoGfJysRbF
         dYhd8MsbXPhJZlbwTuHMEmW4WEkZcogPpGqtl99FXrVhdzR/AD3tIpwoxwUDPHVeoix+
         XKnw==
X-Forwarded-Encrypted: i=1; AKwUvByop0h3BEZqjxm6s/Lw9hD9qc1ckUOk+4V5v4t1GAnOo0VOtdDRU1jYSZTNgfSggn6vRRn7FqoN9Td6eH4=@vger.kernel.org
X-Gm-Message-State: AFuF++l9HAr37qDZr/hGPLStSly5Ntj/lfAXR2OEsNdWShQfvntS73g1
	pxMC4B7yNA33i+K3V74sMhFe8x4DK+jdAO5GZK+o/zcMdvms7Ch26pvI
X-Gm-Gg: AYBFou2w+4WvaW8lAC3aQj2qkgEY8id2VQCTvKfUkaB01DWj8qbBJfP/c3sOaqUAWAL
	lQYf9SPyh20qWmXvnz8kkdq2UCnqF/S4MjzjYSj3haoIDxtTFRLIMYFTqw+xsavk+UcBpSx7HTq
	KUPvIzvTkUu7VI0vn91ejv4qy/KY9Cj7RXhtazrRWjj5St2okNxE1/aB0TpoiU+RU9qdRl31SE3
	zIZCj5CqY3+RKPmbvvTMHjoqzPE+AjuewPaWD8zLRTWJ8Z/DecL4Enl9GpDrX23I6J31ge/w8Wj
	3MGCXwEKvVesn1iETT18JCjUdp/qj35tjOeFXC4Fs8UPHd+nsDMORr45nw+tqwCZHPmdCP4WJiu
	Lw7+bh4IJ8Nf7e4Cr3/VRLCsvSepH8hsZXKzQEFyQWe6rkVYsQJ+vrnj0GfacHleMW3UlUXv39P
	zCPnzuPbDOnmJMCsPlkCOKhUU2IzbJFNivSH/f+B/eeO+DXEfVwG9jEkeHx13i37HzXjScBQ8Lg
	ZbVhFUav4GzPXXNMJsAnRUTsQebSeMNo+k2kIQYRJ8JDe66gNFfpudaVcwvSSk/Pw==
X-Received: by 2002:a05:6512:1189:b0:5b6:31c:bb0c with SMTP id 2adb3069b0e04-5b8b660aab8mr914364e87.9.1789569447505;
        Wed, 16 Sep 2026 07:37:27 -0700 (PDT)
Received: from dau-home-pc.megasoftware.org ([95.139.134.117])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57eb908sm955658e87.79.2026.09.16.07.37.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:37:26 -0700 (PDT)
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
Subject: [PATCH net-next v3 2/9] ip6_tunnel: add drop reasons to the generic RX path
Date: Wed, 16 Sep 2026 17:37:10 +0300
Message-ID: <20260916143717.1875082-3-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916143717.1875082-1-littlesmilingcloud@gmail.com>
References: <20260916143717.1875082-1-littlesmilingcloud@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__ip6_tnl_rcv() mirrors its IPv4 counterpart: five distinct failures
share a single plain kfree_skb().  Reuse the drop reasons introduced
for ip_tunnel_rcv() and the ones the length helpers already return.

Note that skb_vlan_inet_prepare() returns an enum skb_drop_reason that
was simply discarded, and that pskb_may_pull_reason() has been
available all along.

__ip6_tnl_rcv() is reached two ways: ip6_gre (ip6gre, ip6gretap,
erspan) goes through the exported ip6_tnl_rcv(), while the ip6_tunnel
encapsulations (ip4ip6, ip6ip6, mplsip6) reach it from ipxip6_rcv().
As on the IPv4 side, only ip6_gre sets the checksum and sequence
number bits -- tpi_v4, tpi_v6 and tpi_mpls carry nothing but .proto --
so the option mismatch and the old sequence reasons are reachable
through it alone.

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

