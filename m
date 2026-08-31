Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC233AC0FC
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788213119; cv=none; b=d2R30DWDA3CJg+YRv14+6xganLGVX7LfRH381+5cmkv4Kv19A63vQ3P2wyAYP0RDltQ0stigMg26TbdGa4cW6FSpKWCm3UiOOODpSSLEJsiXtx+pnrSNrTKSk0H7CMa1eCT97Y01RIXf68td3I1U+bnrNCgo6Wb9yKBfaB6R9ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788213119; c=relaxed/simple;
	bh=0Vj8tzfWFlfJ24u2ZpDpxJ2AGt2qvJdpJaNpRHArSAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AuR0bgsjMYLApCQHpTV9P93qwk0qwfCv+xQufsR4HuXpxje3XbePgr4OgdSu9nes2hrpOS1Im9ILaEsKpc/W68Wb2U081G/Uq3pS3YtAF6XK1Xsapb/rLJaIrTwzZUo4EsVGU8E0Sh42h6Nt0iLPp09doOgoWVIZuq4orhBzfO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nnMjiiU+; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnMjiiU+"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b5edf31ef4so2975034e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788213114; x=1788817914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vmQ7GvgiZY3wByqIWh2v7F1IlCfje0depDGRFqZIt00=;
        b=nnMjiiU+32bf8E4kOxCXlBGfWNb8fySnaWckNwGAyc8lEo/SccYAa/5P3hoor+drub
         ABvZp/sVcIcXzMYCdFYvDxuAbJ05HtOGDd4NEV4Pu5A7hY6ZIabcskRjno0ykJwhDBPA
         nsquqfIQHFrzg/w/5tjNDHbCJp1RKUUmdg50vTJFCy4mTODgBWQpbvhX9JCz8DvxCZYZ
         Lz2uVjUBn1VM9fGHcn5Rf8lVyz3izJ7rwijI9cGYnVUD4Wgn1skyUC7IerPIhApiupJ9
         eb519JTtuI60Qsu99GvbcnbeX0X8ylQsy4/TF0OgmabFYcplquy3/GirPalYXRbZLGJX
         PkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788213114; x=1788817914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vmQ7GvgiZY3wByqIWh2v7F1IlCfje0depDGRFqZIt00=;
        b=oEIBEMkWd7j2tBDKbmThMXNqzYdWcgfyGAmIgkh7GrQRpXzNlGezdnQVJj7VBWThB7
         SCnqLvcQnDpn/rq3H9WIKUPz1uxxQ/NThcZ4VF+HLXG3NeRB9gEXF2Eq8oLSFXYiITOM
         k1OEfHcAmL61pGf1wDzIIVQE6w4YtPSpPG3OEU0etQZG+AqidztkjSOa0sAdAPbnmugI
         rF4yuT7DSYXigQa9tqjzCQ8xS/IRW0Epb5d+RFid4m/gHBCP/4uScNL6FHNb/XfoFAaR
         g3qVO77jaNU2VN+ZS24nP5/gVEC0F3CwmHFyTO5LpPi9FUXJdXuzOjcDB9GX4/hA1DhP
         k1HQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/JipwE4Tj1szRXes1w38+Us5+DZITFxRZkVu++/4kMuhIak5D36u1gPOKZrbcJrNAS0Nt7NLuEwNet4w=@vger.kernel.org
X-Gm-Message-State: AFuF++nOEt9q7thbl0Tk39JYPilRKj6BiM6/ZWhjQQN/ZZNfAwpqM6Mn
	2Y7c7p+VhAfDDTffI331zqfRQigz0kswIFexL0FjhyZSji/AWUoUL8fs
X-Gm-Gg: AYBFou0iFuk0SI3tiZIh9aCCijlApH196fwhSCD16k+gx+r4M1NR7Xmyk826Waz5iwP
	ZLfl1QqAqWwNZzT+yKunwqe+TXFmBQR1d6FMDKDRsd4Mw2DicJCcmQ59ZB3LWIryG41oJmGF63q
	IJJU2H29rJiPskFhGmUDicNiPy8qvF0aDl2OytE4UriVYDCbydX6OEhhPmJRDcCMfqcPRuHioWq
	3x5jovQqstOun4FyerePXPXMk4hd8fa92lw9ajneSeBDTR2h8q9Um/YM5oVgO9eWcYPkuOXEwqq
	V1+YgdWpqywtWKUXbqNjp0L9cb8DTyueDnNdB8kk7Fl3/+Twe6px88ap/vZiYIZbyRRqBZqW6/0
	8MYeCezJpIRsXh7bD45F/kFBMGbPuzBnbAUcdZlU4cbxxUT0rt4LzmJEbOilvJc1EWUlr8IfuMT
	bdwEKxhQWXUPHpIxzfo1xg1r3DBFYlCugUp+MJB3xy/GMLjfJMmWoc+OHTpk5n7mVnKw5/HZLxn
	mRhZl4E2ElDg67EENTNXGfdGecCDL6oZg==
X-Received: by 2002:a05:6512:3e0f:b0:5b0:eda:de1f with SMTP id 2adb3069b0e04-5b5e68ba39amr7362736e87.6.1788213113392;
        Mon, 31 Aug 2026 14:51:53 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.184.237])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a06a77sm2388782e87.48.2026.08.31.14.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:51:52 -0700 (PDT)
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
Subject: [PATCH net-next 01/11] ip_tunnel: add drop reasons to the generic RX path
Date: Tue,  1 Sep 2026 00:51:27 +0300
Message-ID: <20260831215137.549324-2-littlesmilingcloud@gmail.com>
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

ip_tunnel_rcv() collapses four distinct failures into a single plain
kfree_skb(), so a packet dropped there simply vanishes:

 - the tunnel options carried by the packet do not match the tunnel
   configuration (checksum or sequence number),
 - the sequence number is older than the expected one,
 - the inner network header cannot be pulled,
 - the ECN decapsulation check fails (RFC 6040).

Only the device error counters (rx_crc_errors, rx_fifo_errors,
rx_length_errors, rx_frame_errors) hint at the cause, and they are not
reported to drop_monitor or to the skb:kfree_skb tracepoint.

Add two drop reasons for the tunnel specific cases and reuse the
existing ones for the rest:

 - SKB_DROP_REASON_IP_TUNNEL_CFG_OPTS_MISMATCH is used when the packet
   does not carry the checksum or the sequence number option the tunnel
   is configured for.  This is a configuration mismatch between the two
   endpoints rather than a corrupted checksum: the checksum itself is
   validated earlier, in gre_parse_header().

 - SKB_DROP_REASON_IP_TUNNEL_OLD_SEQ is used when the sequence number
   is older than the expected one.  Unlike the previous one this is a
   property of the received traffic: a remote endpoint that restarts
   and resets its sequence numbering has all of its packets dropped
   until i_seqno catches up.

 - pskb_inet_may_pull_reason() already computes a drop reason,
   SKB_DROP_REASON_PKT_TOO_SMALL or SKB_DROP_REASON_NOMEM, which was
   discarded so far.

 - SKB_DROP_REASON_IP_TUNNEL_ECN already exists and documents exactly
   this check, but until now it was only used by vxlan.

The sequence number test is split in two so that the two cases can be
told apart.  The error counters are left unchanged.

ip_tunnel_rcv() is the RX path of ip_gre, ipip and sit.  The checksum
and the sequence number options only exist for GRE, so the two new
reasons are reachable through ip_gre alone, while the length and the
ECN ones apply to all three.

Assisted-by: Claude-Code:claude-opus-5
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 include/net/dropreason-core.h | 16 ++++++++++++++++
 net/ipv4/ip_tunnel.c          | 19 +++++++++++++++----
 2 files changed, 31 insertions(+), 4 deletions(-)

diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index 2f312d1f67d6..40f94ecb912a 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -128,6 +128,8 @@
 	FN(PSP_INPUT)			\
 	FN(PSP_OUTPUT)			\
 	FN(RECURSION_LIMIT)		\
+	FN(IP_TUNNEL_CFG_OPTS_MISMATCH)	\
+	FN(IP_TUNNEL_OLD_SEQ)		\
 	FNe(MAX)
 
 /**
@@ -606,6 +608,20 @@ enum skb_drop_reason {
 	SKB_DROP_REASON_PSP_OUTPUT,
 	/** @SKB_DROP_REASON_RECURSION_LIMIT: Dead loop on virtual device. */
 	SKB_DROP_REASON_RECURSION_LIMIT,
+	/**
+	 * @SKB_DROP_REASON_IP_TUNNEL_CFG_OPTS_MISMATCH: the tunnel options
+	 * carried by the packet do not match the tunnel configuration, e.g.
+	 * a GRE tunnel configured with 'icsum' or 'iseq' received a packet
+	 * with no checksum or no sequence number.
+	 */
+	SKB_DROP_REASON_IP_TUNNEL_CFG_OPTS_MISMATCH,
+	/**
+	 * @SKB_DROP_REASON_IP_TUNNEL_OLD_SEQ: the sequence number carried
+	 * by the packet is older than the one expected by the tunnel, e.g.
+	 * after the remote endpoint restarted and reset its sequence
+	 * numbering.
+	 */
+	SKB_DROP_REASON_IP_TUNNEL_OLD_SEQ,
 	/**
 	 * @SKB_DROP_REASON_MAX: the maximum of core drop reasons, which
 	 * shouldn't be used as a real 'reason' - only for tracing code gen
diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
index e6bcf01411d0..ab8bae8ba781 100644
--- a/net/ipv4/ip_tunnel.c
+++ b/net/ipv4/ip_tunnel.c
@@ -379,6 +379,7 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 		  bool log_ecn_error)
 {
 	const struct iphdr *iph = ip_hdr(skb);
+	enum skb_drop_reason reason = SKB_DROP_REASON_NOT_SPECIFIED;
 	int nh, err;
 
 #ifdef CONFIG_NET_IPGRE_BROADCAST
@@ -392,14 +393,22 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 	    test_bit(IP_TUNNEL_CSUM_BIT, tpi->flags)) {
 		DEV_STATS_INC(tunnel->dev, rx_crc_errors);
 		DEV_STATS_INC(tunnel->dev, rx_errors);
+		reason = SKB_DROP_REASON_IP_TUNNEL_CFG_OPTS_MISMATCH;
 		goto drop;
 	}
 
 	if (test_bit(IP_TUNNEL_SEQ_BIT, tunnel->parms.i_flags)) {
-		if (!test_bit(IP_TUNNEL_SEQ_BIT, tpi->flags) ||
-		    (tunnel->i_seqno && (s32)(ntohl(tpi->seq) - tunnel->i_seqno) < 0)) {
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
@@ -413,7 +422,8 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 
 	skb_set_network_header(skb, (tunnel->dev->type == ARPHRD_ETHER) ? ETH_HLEN : 0);
 
-	if (!pskb_inet_may_pull(skb)) {
+	reason = pskb_inet_may_pull_reason(skb);
+	if (reason) {
 		DEV_STATS_INC(tunnel->dev, rx_length_errors);
 		DEV_STATS_INC(tunnel->dev, rx_errors);
 		goto drop;
@@ -428,6 +438,7 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 		if (err > 1) {
 			DEV_STATS_INC(tunnel->dev, rx_frame_errors);
 			DEV_STATS_INC(tunnel->dev, rx_errors);
+			reason = SKB_DROP_REASON_IP_TUNNEL_ECN;
 			goto drop;
 		}
 	}
@@ -451,7 +462,7 @@ int ip_tunnel_rcv(struct ip_tunnel *tunnel, struct sk_buff *skb,
 drop:
 	if (tun_dst)
 		dst_release((struct dst_entry *)tun_dst);
-	kfree_skb(skb);
+	kfree_skb_reason(skb, reason);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(ip_tunnel_rcv);
-- 
2.47.3

