Received: from mail-lr2-f34.google.com (mail-lr2-f34.google.com [74.125.230.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F5A4DF4BE
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 20:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791231267; cv=none; b=YL5EzJFgr0GPrI2CxkXg3uziVF9skEkVsdUCykp1sVGS+c9BiR5QU3jUbZ01LQuacCfwmNVxZOhN11+QhWl2na8LRcLTzEE5Svhg/LCCEERHxdsYHufU4KSiRnnubRNFSaeigaUQvwWBcFOo4xqCwHX3nxxHwqJgUbZ9ImaBRjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791231267; c=relaxed/simple;
	bh=xY9JZG8HC/2aqUwmtB4ogBeD+kqpbvsS/ZPF812bq3A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rRXMUY8NaPzllnUmIsMpop7w/U8J5QQsFikFUN+cSWZIKDOiB47Qs2XLvXEIfWrGzCJ4gifjGnMkb/sdhCZLXaapVWQM11PyMXdJFFDF8nDa2xgyjXRZn5hsLeV8ibN6MnB0YA4O1b3QwhZ47a9EXwHCwft0+TRqLGdjDF1vq8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qNK1LDXf; arc=none smtp.client-ip=74.125.230.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qNK1LDXf"
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a77141826cso19810551fa.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 13:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791231264; x=1791836064; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZeMH/+OlF6ABI9FtgeKcF+jiH4fPSdv3n+T6mLOtdI=;
        b=qNK1LDXfpC38sEcnEgAjFlMLm//zvdgI6mp6Voenl0X5lrjWmP2wLRqo150+ywjQse
         GybpkSzg6p228lHFB4H0PdOCSh7Ph7GCWo7AhSo1tznSOmyiuyxIQ2FkeE8fjjUfloyN
         q8YSyFDT/ECQsD88KAZqKQbPxgiEi7J0upTOWsZpQFVl4qDFl+JS7/w7FC4AY1TKggP5
         qit4iLH6EVVZRRzT4n2yxR5z6i3mzKX959/z72WKBzYE0zGSFLqOl/QXJLcPOhKDlQ4d
         u7Y+VcEndGFPqHUNKCMQZljmnyyzNELUNStcrNCow5xQCAQVj/sJBJX59lJ4IUX7M+oH
         arzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791231264; x=1791836064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vZeMH/+OlF6ABI9FtgeKcF+jiH4fPSdv3n+T6mLOtdI=;
        b=NIIVpkiv7f/lIcG1Kg4mTi855SAqt7iNQ6TedKVF7M5SuYp1mI84FZwnJU9RtxFYyj
         SSfv7HsqOBYStZgMllY0qptMgPJNn2ER0IGzIZ2baBuVq4OkCCbhk/sojjeHd3RsJWgd
         bEPhAjhoIOkHujV5JbYMjXjfoUPPO111hmzMckYIHgooWV5UBK1ElOKnf/TpxiTUa9U4
         RCMYY5Chn8+Evzg9Txny6InV6GH8PCQi/zowy3b00oHM4eCWC8bKl2Z74OLS70IMIH8R
         hExNsqTw4ik6YxM9tdeUQxMyKWABuKHqB4Tlf/NV3tkoYE7wtw4ym8lgCKirxXYd0cF/
         b9Xw==
X-Forwarded-Encrypted: i=1; AKwUvBw09Ey7W6YT72LwJV+3C5oXdi8ALFpL7kQ0fzuGwAx4Z513ByF0pFu6fxlagEvmv6wtGHRHsIZRQ0925eM=@vger.kernel.org
X-Gm-Message-State: AFq9FYITawFsE0NA17MAIDEP2KHIoYDlI4UV/pehA3JUUFqlivjnEdkm
	eXtJiDTcRtN5XKGNjy92GpCZ4VMlVyAIky8jCJozBOUS/U/dxT+YsPbQ
X-Gm-Gg: AYBFou06wcC3jyAbzn8IMzw/V/1dXn2CKzSKD4S8I6MXPMqE6NKMHEtC7v7ICniK5ms
	XyKER3KJM7yEcZnx2qi4Wu0W/e5kbf3H1zJ3nKS176oGtHcBZYX3Y+xFO00YOdBu6M9T4h8Y9pq
	65uA+56k9N/0AC66wiFgyZnurO7LA8AUka3fLkf7k6G+NchZK+BqqLXU2laywwE77MKQcbcLtGW
	RvzqRk6nMqa0qDEmmGKSJDT6kLAh2TuHD6JcAJwYV1tJ1gqvsTQMnTQVoj57kta2WVHQJq3Nm/J
	hUWs9V/2rqHGsRs8dFwiYXLdSGQRE+WhkB03RRkwtuvK6lLiK+4yF9TdVKWhsKiMUFoif4Lf2S5
	2rZtmOYFlgkA6pJAQLAIBDTFkIFVVVDHBSWVu78egLWzZtbpnlH7KggIn9JGxcB+40/53zaZGVd
	+AgJfboNQtltS19l2/MxjkNf0rMNLEUMH1dyhJGTkDRHix7Z+JtO15wRltHM3aJyJgpgBXDTU5E
	y5+KWqCdQ8A/LMUE1+ZKsesXls6IfhOoJKd1EnYwg==
X-Received: by 2002:a05:651c:1544:b0:3a9:825c:778e with SMTP id 38308e7fff4ca-3a9825c847dmr16282081fa.28.1791231263797;
        Mon, 05 Oct 2026 13:14:23 -0700 (PDT)
Received: from dau-home-pc.. ([212.35.161.1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e303889sm43114681fa.20.2026.10.05.13.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 13:14:21 -0700 (PDT)
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
Subject: [PATCH net-next 1/4] vxlan: rename the drop reasons for use by other tunnels
Date: Mon,  5 Oct 2026 23:14:14 +0300
Message-ID: <20261005201417.906344-2-littlesmilingcloud@gmail.com>
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

VXLAN_INVALID_HDR and VXLAN_VNI_NOT_FOUND describe conditions that are
not specific to vxlan: a malformed tunnel header, and a packet for
which no tunnel device is found. The GRE receive paths drop packets
for the same two conditions, and can report them with the same reasons
once they are converted to drop reasons.

Rename them to TUNNEL_INVALID_HDR and TUNNEL_NOT_FOUND and reword their
descriptions, the way VXLAN_NO_REMOTE became NO_TX_TARGET in commit
46e0ccfb88f0 ("net: vxlan: rename SKB_DROP_REASON_VXLAN_NO_REMOTE").
The numeric values stay the same; the names that the skb:kfree_skb
tracepoint and drop_monitor report change.

Suggested-by: Ido Schimmel <idosch@nvidia.com>
Assisted-by: LLM
Signed-off-by: Anton Danilov <littlesmilingcloud@gmail.com>
---
 drivers/net/vxlan/vxlan_core.c |  8 ++++----
 include/net/dropreason-core.h  | 19 +++++++++++--------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/net/vxlan/vxlan_core.c b/drivers/net/vxlan/vxlan_core.c
index 27b0b6567d52..35a47cc27200 100644
--- a/drivers/net/vxlan/vxlan_core.c
+++ b/drivers/net/vxlan/vxlan_core.c
@@ -1700,7 +1700,7 @@ static int vxlan_rcv(struct sock *sk, struct sk_buff *skb)
 	if (!(vh->vx_flags & VXLAN_HF_VNI)) {
 		netdev_dbg(skb->dev, "invalid vxlan flags=%#x vni=%#x\n",
 			   ntohl(vh->vx_flags), ntohl(vh->vx_vni));
-		reason = SKB_DROP_REASON_VXLAN_INVALID_HDR;
+		reason = SKB_DROP_REASON_TUNNEL_INVALID_HDR;
 		/* Return non vxlan pkt */
 		goto drop;
 	}
@@ -1713,7 +1713,7 @@ static int vxlan_rcv(struct sock *sk, struct sk_buff *skb)
 
 	vxlan = vxlan_vs_find_vni(vs, skb->dev->ifindex, vni, &vninode);
 	if (!vxlan) {
-		reason = SKB_DROP_REASON_VXLAN_VNI_NOT_FOUND;
+		reason = SKB_DROP_REASON_TUNNEL_NOT_FOUND;
 		goto drop;
 	}
 
@@ -1729,7 +1729,7 @@ static int vxlan_rcv(struct sock *sk, struct sk_buff *skb)
 		 * previous stack code, and also is more robust and provides a
 		 * little more security in adding extensions to VXLAN.
 		 */
-		reason = SKB_DROP_REASON_VXLAN_INVALID_HDR;
+		reason = SKB_DROP_REASON_TUNNEL_INVALID_HDR;
 		DEV_STATS_INC(vxlan->dev, rx_frame_errors);
 		DEV_STATS_INC(vxlan->dev, rx_errors);
 		vxlan_vnifilter_count(vxlan, cfg, vni, vninode,
@@ -2389,7 +2389,7 @@ static int encap_bypass_if_local(struct sk_buff *skb, struct net_device *dev,
 			DEV_STATS_INC(dev, tx_errors);
 			vxlan_vnifilter_count(vxlan, cfg, vni, NULL,
 					      VXLAN_VNI_STATS_TX_ERRORS, 0);
-			kfree_skb_reason(skb, SKB_DROP_REASON_VXLAN_VNI_NOT_FOUND);
+			kfree_skb_reason(skb, SKB_DROP_REASON_TUNNEL_NOT_FOUND);
 
 			return -ENOENT;
 		}
diff --git a/include/net/dropreason-core.h b/include/net/dropreason-core.h
index 12f909651591..40a27d8887af 100644
--- a/include/net/dropreason-core.h
+++ b/include/net/dropreason-core.h
@@ -111,8 +111,8 @@
 	FN(PACKET_SOCK_ERROR)		\
 	FN(TC_CHAIN_NOTFOUND)		\
 	FN(TC_RECLASSIFY_LOOP)		\
-	FN(VXLAN_INVALID_HDR)		\
-	FN(VXLAN_VNI_NOT_FOUND)		\
+	FN(TUNNEL_INVALID_HDR)		\
+	FN(TUNNEL_NOT_FOUND)		\
 	FN(MAC_INVALID_SOURCE)		\
 	FN(VXLAN_ENTRY_EXISTS)		\
 	FN(NO_TX_TARGET)		\
@@ -539,13 +539,16 @@ enum skb_drop_reason {
 	 */
 	SKB_DROP_REASON_TC_RECLASSIFY_LOOP,
 	/**
-	 * @SKB_DROP_REASON_VXLAN_INVALID_HDR: VXLAN header is invalid. E.g.:
-	 * 1) reserved fields are not zero
-	 * 2) "I" flag is not set
+	 * @SKB_DROP_REASON_TUNNEL_INVALID_HDR: tunnel header is invalid. E.g.:
+	 * 1) VXLAN reserved fields are not zero
+	 * 2) VXLAN "I" flag is not set
 	 */
-	SKB_DROP_REASON_VXLAN_INVALID_HDR,
-	/** @SKB_DROP_REASON_VXLAN_VNI_NOT_FOUND: no VXLAN device found for VNI */
-	SKB_DROP_REASON_VXLAN_VNI_NOT_FOUND,
+	SKB_DROP_REASON_TUNNEL_INVALID_HDR,
+	/**
+	 * @SKB_DROP_REASON_TUNNEL_NOT_FOUND: no tunnel device found for the
+	 * packet, e.g. no VXLAN device for its VNI
+	 */
+	SKB_DROP_REASON_TUNNEL_NOT_FOUND,
 	/** @SKB_DROP_REASON_MAC_INVALID_SOURCE: source mac is invalid */
 	SKB_DROP_REASON_MAC_INVALID_SOURCE,
 	/**
-- 
2.47.3

