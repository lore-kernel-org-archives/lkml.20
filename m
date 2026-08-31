Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53B83B14D0
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788213124; cv=none; b=KECJhYpjDGO4jKnXnKVwgyJgO5GiDj7/UoifNV68AljncEcs0SVZFGO4zFUMKOsuHUk2w09U5jV1HVxAl/1J2MLsa2mGuSDMssB4SC8gaQ6zSqRFIrnbr/+4ZHpYZxpe30y9qMFn3GWKz73NKqUjlAU240nIcxuuVKYg0+OveZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788213124; c=relaxed/simple;
	bh=3qvZ3aiO+s+CVAa4MERALYDlYKjhPNcy4xFtFfaY6/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jf5+pSwwH/y3hoaXyDNwvX2AR+3cvmpse4SaGUqxKUI/U5gG0vdi4ipMEV2WltwQw8TxvhkOKsoDjZ3CZ4s4FYJJ275BAX2iWQYR7he+3TJMUV5zvJlNVQ2vsqL9dpDgO6xVRjhnbI3ysQgQkkB/HfZXIdR2V3tRqoaibtjOfQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N16BYGlx; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N16BYGlx"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b15dcaca31so3284029e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788213115; x=1788817915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2NyiM+FHtIF3Ks/VyMyFTJauOhca6iS4MuHeOc8+lYc=;
        b=N16BYGlxO4G1pur2uOucSPNCBDx88uG9h0z67tYE1BE4K4IzYXu6iflRAaY4t3bNzU
         Pn6DYwzbnJmsPUdJk3mT6jv9uRCw1/tv117jQhLp2YxYpH2e8ArRn7ydV5cG87HjDDmC
         lkqh8o8aaI3Bays1lRE1hnYREwFyontGH3O/RBGR64cyVnCsyVVkFB5E3SNKsA8CuU/B
         M894k/KQ8fbiL7q5v7iEfmR3a7zpl2I5aUVRycMMrn0SI6gTLoN/WgyZ11vUBazEfxV4
         HddbPvZOsbyPC7NJKvocTHCUpOQHogd7CjnllnpZ7d3fnNKr/PAylsb4I/UFvDIYUXIE
         ln3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788213115; x=1788817915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2NyiM+FHtIF3Ks/VyMyFTJauOhca6iS4MuHeOc8+lYc=;
        b=tPobucqpQg2Ct+CPx0WFMHChnrfXv9TtYBJyHDCcsih6BCBzueTfqSdDqdGRKcH2UL
         sTicozHOau5YkINLGyAs0BQQK6cxT1CNI/+JTMcLgtqhbZ1pVbOpBou6F+DqX2tUGP8w
         COgebsz2fPskci70hV7Qfrnq8ONCeNQZAs8c1+4qVwgdoWad7ErJRnuVEdVGtKgrfPZQ
         6XHN7VoqoYn420vft/UiZ6lZMjcu2iSUhTK42zqs6RcaL5uVFJrBBgY38CNlROerSbsn
         aiGsfKkG5nw1gjLL772+Ywik6+Dhmy5PpHhfhHWDcZnTMMoHFgN4OAOUEnN4Y4s60eXR
         +LxQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0bKs6DJwQv5qUSx6i7bj/HgeK2oQG062tRxGY6Mo2qvtAtgewEneIalNKMER5EN5Zum2qVdhmpqzs5Sg=@vger.kernel.org
X-Gm-Message-State: AFuF++kwhhhMqPAt7j24mC98m3nUHYM8j9E4kHPk6GWGI0U/jAp6c1YH
	VbECElQl0N+2EnvW2HCaGgS22pEu5E81IVqZQ5l2QY0VQ8gpFPqrbPIT
X-Gm-Gg: AYBFou2vwDEfjN47LeMcKBXVRChmeDVsMullcPxTNHE82H5WCP4P0t3f5NsjDLMPpyC
	TwfgTV6+9Xo7Dw9689tbPG6gpjDmJKsqDPtk/RA8sNj1gyglpe2ZI+GKAXVpisN0Pqi3GP70hcG
	BnOO9QXBWPtbrPPRO9C0UsASKt7Xf3lXatJZ3p6oHyvAZjGTj2MtdbFdspbKm2AjuHPS+kM1bxB
	6Twyyh2Nqn/lfHk39cx1j+5AWVdLwsRSo78opXSVxF7/LSVI/7bybX+SRC/m+s9YHxu7O7gNCiz
	yOoEVj/GpaCQkInW3ySAqPd8rq7NCimFvcDhgLl2hatOYEa5YFLDCvu4Iy4B78NPQUW9F7l5ym6
	6esFC7nfKffPmuwUO369UhyJN7uPe5R4zVJHoWJe6Rtbr93yzDMM1GfKNJM/XK3h4on2L3kyBho
	O150ALEQIlcAF/94RAfLeu6/J1VTgINzb2kWBaSqoCn68CLMyM50cuuud96jiiQ6R5Mx/sVR5A/
	KbTgwQCLEUJBRjkJkFrqzBXwovp4rRa3w==
X-Received: by 2002:a05:6512:3053:b0:5ae:b7ce:9ca5 with SMTP id 2adb3069b0e04-5b5fe0902a3mr1665824e87.18.1788213114642;
        Mon, 31 Aug 2026 14:51:54 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.184.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a06a77sm2388782e87.48.2026.08.31.14.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:51:54 -0700 (PDT)
From: Anton Danilov <littlesmilingcloud@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	David Ahern <dsahern@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next 02/11] ip6_tunnel: add drop reasons to the generic RX path
Date: Tue,  1 Sep 2026 00:51:28 +0300
Message-ID: <20260831215137.549324-3-littlesmilingcloud@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260831215137.549324-1-littlesmilingcloud@gmail.com>
References: <20260831215137.549324-1-littlesmilingcloud@gmail.com>
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

__ip6_tnl_rcv() is reached through ip6_tnl_rcv() from both ip6_tunnel
(ip4ip6, ip6ip6) and ip6_gre (ip6gre, ip6gretap, erspan).  As on the
IPv4 side, only ip6_gre sets the checksum and sequence number bits, so
the option mismatch and the old sequence reasons are reachable through
it alone.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 net/ipv6/ip6_tunnel.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/net/ipv6/ip6_tunnel.c b/net/ipv6/ip6_tunnel.c
index d5ff50a2ac01..85578fa125bc 100644
--- a/net/ipv6/ip6_tunnel.c
+++ b/net/ipv6/ip6_tunnel.c
@@ -814,21 +814,29 @@ static int __ip6_tnl_rcv(struct ip6_tnl *tunnel, struct sk_buff *skb,
 			 bool log_ecn_err)
 {
 	const struct ipv6hdr *ipv6h;
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	int nh, err;
 
 	if (test_bit(IP_TUNNEL_CSUM_BIT, tunnel->parms.i_flags) !=
 	    test_bit(IP_TUNNEL_CSUM_BIT, tpi->flags)) {
 		DEV_STATS_INC(tunnel->dev, rx_crc_errors);
 		DEV_STATS_INC(tunnel->dev, rx_errors);
+		reason = SKB_DROP_REASON_IP_TUNNEL_CFG_OPTS_MISMATCH;
 		goto drop;
 	}
 
 	if (test_bit(IP_TUNNEL_SEQ_BIT, tunnel->parms.i_flags)) {
-		if (!test_bit(IP_TUNNEL_SEQ_BIT, tpi->flags) ||
-		    (tunnel->i_seqno &&
-		     (s32)(ntohl(tpi->seq) - tunnel->i_seqno) < 0)) {
+		if (!test_bit(IP_TUNNEL_SEQ_BIT, tpi->flags)) {
 			DEV_STATS_INC(tunnel->dev, rx_fifo_errors);
 			DEV_STATS_INC(tunnel->dev, rx_errors);
+			reason = SKB_DROP_REASON_IP_TUNNEL_CFG_OPTS_MISMATCH;
+			goto drop;
+		}
+		if (tunnel->i_seqno &&
+		    (s32)(ntohl(tpi->seq) - tunnel->i_seqno) < 0) {
+			DEV_STATS_INC(tunnel->dev, rx_fifo_errors);
+			DEV_STATS_INC(tunnel->dev, rx_errors);
+			reason = SKB_DROP_REASON_IP_TUNNEL_OLD_SEQ;
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

