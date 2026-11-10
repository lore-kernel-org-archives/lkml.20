Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348420;
	b=2RBz5k9nX4zffpTOOwU5SR2QKJedjDUcit/OJ0PVT1d+tMJbTfD7OsZtddm1yLqozFU4
	 O4o31C6D2uoEKZMRuM7iUyo9CZrRdyMoZV5VMwJJ5FAZa/Cc4GTybeVN5IAWQQW7WR7KF
	 vNft77i2WsuNLpF9nz2Hc9fFd7sFze+5uOgXdDa5HJ0LW1/V/szqetIQqFCqxWgglLUGg
	 tkGimrSafL9dLOI8pfPY+1B/QTva0OeLI5+DeLIjdDBbNurOzwJSxuohv/zFtK+5fU7P4
	 Y4vS4uFoQvij4allogUzXGa4TSKBf6Nl45nLFSyp2IionkgpagZCPjILlor7xBvlczA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348420;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=L1CME/PdqAtK6fTk+OjSyhi24vRJH8mOY9MTHCX4fQs=;
	b=nLv9d06szzFAhXKbb89gLHTQ9Tvos/I8XGQkP66e7AFP3tv+Z+2fkFO8nI21D8OKjy1Z
	 1IAiPuXqIh7/0BRJkipvUeozsjOJSlexLK+kmkRq0IhIcyWhBD0vB8xKSTtztaMDwo6S2
	 G9Z1ASbCtzNoHykXC2VOCiAPiJMHnVo29EC/hKrO8Ybgcs6sbJjZbQmpoI5BFLusV81T5
	 mfNLyYC3RvRsz0eJxVEZmRv/+cGSk3Jhtte6syADNe3Kb3RAdA/3XtGsn0k5nn/I6Kstc
	 Afmsmj4mU8VJK4A0ixDH4+GtnwFyDmS2UrbCbnBjRCVvvkz0N45/80PcQ7wcrcGki9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tu7chxr9;
	arc=none smtp.remote-ip=209.85.128.173
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DED60A383A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90DED60A383A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tu7chxr9
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8b31448caccso20765867b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794348419; x=1794953219; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L1CME/PdqAtK6fTk+OjSyhi24vRJH8mOY9MTHCX4fQs=;
        b=tu7chxr9lTHSpeArUj0qxc48Q3LyVi/yMAQXybtp0NFwktdNshnDRyg7n7wTG0zJoQ
         bhIiH6ehNWKKhfnTuEOH1l5EfvkgY6akXzg9xIuTMzgPuYHBVQJU5YWWeWdUZ9uKP+qu
         gn5Nxl45ecVb1jNGLU9mO35veAd6qCRZILpjMwZJbZVoOprZ8RxpaiFGkRbHAJP+RVZj
         /fF8sMdbE6KXHjptFfjw7CYUDRroQGJ+jiVWzU5fmeFt17I7DYh53UqF9+ZID5YKUBKi
         lUUMXkzvdOy2mKHBO+xhQS43XoaY+5GmVm0sqIiR0yd08x6bh3KJNGuvCoz301ETNdu4
         2zWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348419; x=1794953219;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L1CME/PdqAtK6fTk+OjSyhi24vRJH8mOY9MTHCX4fQs=;
        b=aKcYM+pF1iudQTijUpYX4ABzyIaoa8GZBOePh02dnoDprSjecC6WloQAVUt6AvddTT
         g4waftIi0IIeWEZ/V+rH1GXvhASP5hbid4JYl4z5Ha/pSjJ6+pfUbHzBNysRdfPwj16t
         K2IvERgSjehamI4l+gDGqI8Yc9VbvfOG2m9buvHk9JdLF2RfMW0hbtzMyWNkdbcF99c5
         5khAnaM3Iw8Q8098YYju768DdmjnHZHSNm/o1udZ296tCfHqwOWr6plKAsmbVSRAJ7Bl
         /MoldVMG1/pkW+rEB/kJQqFeu0g7WF0qtKq4GsZ67Ib1bIkEuQWjxMZdiojJcFhnxm1i
         R9PA==
X-Forwarded-Encrypted: i=1; AL+hErEWnoFnqJ4v1CMhZdNCgPRrv8WQsBdibT4DZnx7IAMqfDfIorfX1W5kV6AMSihAWbRlIt1PIGPZkzq22Uo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/EAFNeEhfiAcvzFjV1orf4biX6YyrWGLMm52QbgWhg34e3zbql
	SasXM+MiQmZNHXBYud2OQKTCVmKIp4ffOFyB1lmPWOQy4WQB07u3kBrR
X-Gm-Gg: AYBFou2l8dxlL1WEVC97ovt2fFw02tONzpqswOTQzX2QTIenhORH8idujhVahZxum7f
	P/dOaWh+/I6pmRl+LM1COOZg5Nq1fWSe8/B93PcKRjQ1WnU+v3k+UwSXai1hS5VIPWLA0Wn+A/9
	k7XqqReS/xHQdlKPVZCYx2xpnEskIJFg2gDTlQ3C7oVob0+nEYeFL1kjIkmib5X1lpxW1GUBYfi
	u8DM0fHpoVII4XsRzMV52CfxmAMqh3FdiRQj1DcjVo0+/Zj+qIoTZy60vZbww5Ynv5hdyY81hbT
	pmmnHqtP/pUR7lFB7oFskbZj6OhOo/h+9yYwQlnZkWEEkavg//ByCjWnOqZnG+diZqXDZMvPz3a
	Eyi2mdLOpwGsgcbXP86bQZkyYTH/SC6BR29FnYOkT+j5WpqUbfbAfmuGJbeF7cp5baocIdYc4w9
	ZPnDShnOdUIcJ5yi6JOKstge3uDm54EvDJ054PowM4NSSK3A3rFuUzCr/vXjs/AY2q8z2MgBK7g
	8WQD5E4kwL+zv60tQQlFghwtmcyiUB9YZzBwW45ZOC6+3smYEMTiQJBkpHwd8bLEsomLGToJU9B
	cfDAuSUz1iivEZWu4FbRocLdHO0=
X-Received: by 2002:a05:690c:113:b0:8b1:e7c:cdcb with SMTP id 00721157ae682-8b3a7fe6a1amr5656197b3.23.1794348418497;
        Tue, 10 Nov 2026 14:06:58 -0800 (PST)
Received: from localhost ([2a03:2880:30ff:45::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b39324c076sm30025117b3.5.2026.11.10.14.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 14:06:57 -0800 (PST)
From: Daniel Zahka <daniel.zahka@gmail.com>
Date: Tue, 10 Nov 2026 14:06:39 -0800
Subject: [PATCH net-next v2 6/6] eth: mpnic: add GSO_PARTIAL for other
 tunnels
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-mpnic-lso-v2-6-ccd37b051d08@gmail.com>
References: <20261110-mpnic-lso-v2-0-ccd37b051d08@gmail.com>
In-Reply-To: <20261110-mpnic-lso-v2-0-ccd37b051d08@gmail.com>
To: Alexander Duyck <alexanderduyck@fb.com>, 
 Jakub Kicinski <kuba@kernel.org>, kernel-team@meta.com, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Dimitri Daskalakis <dimitri.daskalakis1@gmail.com>, 
 Mohsin Bashir <mohsin.bashr@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0

Tunnels that are not natively supported for segmentation can be
supported with GSO_PARTIAL. For GSO_PARTIAL, the driver uses L3 type
OTHER, which tells the device to suppress any updates to the l3 headers
of the packet. As a consequence of this, MANGLEID is required when the
inner l3 is ipv4, and for tunnels that have an outer l3 of ipv4, we need
to check if DF is set in mpnic_features_check_encap_gso(), because the
device will not edit the IDs of the wire packets.

Signed-off-by: Daniel Zahka <daniel.zahka@gmail.com>
---
v2:
- derive the L3 header length from csum_start rather than
  inner_transport_header, matching mpnic_features_check() and
  mpnic_tx_lso()
---
 drivers/net/ethernet/meta/mpnic/mpnic_csr.h    |  1 +
 drivers/net/ethernet/meta/mpnic/mpnic_netdev.c |  9 +++++++++
 drivers/net/ethernet/meta/mpnic/mpnic_txrx.c   | 21 ++++++++++++++++++++-
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_csr.h b/drivers/net/ethernet/meta/mpnic/mpnic_csr.h
index 63282916eb13..03304e22d6ce 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_csr.h
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_csr.h
@@ -29,6 +29,7 @@ enum {
 #define MPNIC_TWD_FLAG_REQ_COMPLETION	DESC_BIT(37)
 #define MPNIC_TWD_L3_TYPE		DESC_GENMASK(42, 40)
 enum {
+	MPNIC_TWD_L3_TYPE_OTHER	= 0,
 	MPNIC_TWD_L3_TYPE_IPV4	= 1,
 	MPNIC_TWD_L3_TYPE_IPV6	= 2,
 	MPNIC_TWD_L3_TYPE_V6V6	= 3,
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
index 032a5ee92a08..198aad631c65 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_netdev.c
@@ -322,7 +322,15 @@ struct net_device *mpnic_netdev_alloc(struct mpnic_dev *mpd)
 	mpn->num_rx_queues = queues;
 	mpn->num_napi = queues;
 
+	netdev->gso_partial_features =
+		NETIF_F_GSO_GRE |
+		NETIF_F_GSO_GRE_CSUM |
+		NETIF_F_GSO_IPXIP4 |
+		NETIF_F_GSO_UDP_TUNNEL |
+		NETIF_F_GSO_UDP_TUNNEL_CSUM;
+
 	netdev->features |=
+		netdev->gso_partial_features |
 		NETIF_F_GSO_IPXIP6 |
 		NETIF_F_SG |
 		NETIF_F_HW_CSUM |
@@ -330,6 +338,7 @@ struct net_device *mpnic_netdev_alloc(struct mpnic_dev *mpd)
 		NETIF_F_TSO |
 		NETIF_F_TSO_ECN |
 		NETIF_F_TSO6 |
+		NETIF_F_GSO_PARTIAL |
 		NETIF_F_GSO_UDP_L4;
 
 	netdev->hw_features |= netdev->features;
diff --git a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
index 839feb4716b6..af5e490c112d 100644
--- a/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
+++ b/drivers/net/ethernet/meta/mpnic/mpnic_txrx.c
@@ -236,6 +236,9 @@ static void mpnic_tx_fill_hdrs(struct sk_buff *skb, struct mpnic_tx_hdrs *hdrs)
 		hdrs->i3len = skb_transport_offset(skb) - net_off;
 		hdrs->l3_type = ip_hdr(skb)->version == 4 ?
 				MPNIC_TWD_L3_TYPE_IPV4 : MPNIC_TWD_L3_TYPE_IPV6;
+	} else if (skb_shinfo(skb)->gso_type & SKB_GSO_PARTIAL) {
+		hdrs->i3len = skb_checksum_start_offset(skb) - net_off;
+		hdrs->l3_type = MPNIC_TWD_L3_TYPE_OTHER;
 	} else {
 		inner_off = skb_inner_network_offset(skb);
 		hdrs->o3len = inner_off - net_off;
@@ -397,11 +400,27 @@ static bool mpnic_ipxip6_gso_ok(struct sk_buff *skb)
 static netdev_features_t
 mpnic_features_check_encap_gso(struct sk_buff *skb, netdev_features_t features)
 {
+	struct iphdr *iph;
+
 	if (skb_shinfo(skb)->gso_type & SKB_GSO_IPXIP6 &&
 	    mpnic_ipxip6_gso_ok(skb))
 		return features;
 
-	return features & ~NETIF_F_GSO_IPXIP6;
+	features &= ~NETIF_F_GSO_IPXIP6;
+
+	iph = ip_hdr(skb);
+	if (iph->version == 4 && !(iph->frag_off & htons(IP_DF)))
+		return features & ~NETIF_F_GSO_MASK;
+
+	/* HW can segment inner udp4 with fixed IDs, but there is no UDP
+	 * analog for MANGLEID, so defer to SW GSO.
+	 */
+	if (inner_ip_hdr(skb)->version == 4)
+		features &= ~NETIF_F_GSO_UDP_L4;
+	if (!(features & NETIF_F_TSO_MANGLEID))
+		features &= ~NETIF_F_TSO;
+
+	return features;
 }
 
 netdev_features_t mpnic_features_check(struct sk_buff *skb,

-- 
2.52.0

