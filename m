Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390412;
	b=HG1LOwf73SdkflyNx7AmMwozk+4whLvXTuMGtwNxRWBvp8kpPUL4SqQ2wQO3L6MQbIuP
	 0H659DF1i8MT7VarM07t0GIbC1e0VVkkcNzpkhjrur4TIxzLrqEDmYPVwYKmXaxB2h5w6
	 i1+SKUxIoFHXXij0HaTS1Gy/3ngUZ1Y/nrmIRCQoP6+gX65kU9U7yNy/biFieSgjeQcz0
	 OU+4AnfkBHM+lCfKUjCjFg6No/wD9vChhRIxa/lGZRXlBwHPFoJsifpFVwl9hpvxtBBe6
	 7p6T529jaY4Qv9SuvL4lCnnNrr6vud9SRBxNmftqBgXfeSn6a3So/j7gdzFlrPKSrww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Y44aow/nayNy5Wp7Un6ph+uEEb81sUJemcaPSuxz7D0=;
	b=RdxCf+qe42+QFpdrH5eckKJkuxDxdNRCMA82R1wYA9/bi6+LpmZWhQxO+XquaISQL7pm
	 9hrRaI8r8UmweMBY8zwWnbwye0MiJLO+Vz+ZJlNMmNNeagMYLirLpkC02FitxlChl+G0D
	 LgvO6Hmg03gdCB6S9XcRmz65LdHkVQopqg+hZNvCri6iCUkKT3b8KuoZf5510Qm8IUKFn
	 uBBGEzEpL1GgAXbt+rM9F9IXbK7lp1PMeNjOT2gW9arAszGL1Heps1Lbg2udlyAw4ilJU
	 GWH4Sx7Nmf7Kjx2yM4ANwHJPQRGTymsl0/4RyiGVGSL5aoNVbvlnG1Om3nYqkby2b4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="JWKe2h/V";
	arc=none smtp.remote-ip=209.85.214.172
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F01606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5F01606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JWKe2h/V
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2e96502e447so24776265ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794390410; x=1794995210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y44aow/nayNy5Wp7Un6ph+uEEb81sUJemcaPSuxz7D0=;
        b=JWKe2h/VIid/PXd/N4kaZOI8/txjRa3ShT6O0QmNJs5KHRAHJIvFakl1541MEDbsph
         /d2/Lp9Db8dSkyEofjxH2O49xXVpe+VkzhW5x2ELw6S6oZE4YQgi+Duv+KVRzWp5OWT2
         EzzTQtU7JP6CHNqDI5VnAZiCgHqTmR+CgoVActz8EIVpDB/l7ND60QmHP4EVwqO0o7rg
         3T0Yk5e5LPvt2gd61rTW53M95FdtTlLFC7Zaxv7n6r+8ip8eaX6tBWfXmHIHW8sNUVNZ
         xVh42EOJvEikLnClDtS57DRPXIye4hEiIJSvfDgcEosq6lkEqKtjrDtW5xpFEHBPIIK1
         WDGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794390410; x=1794995210;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y44aow/nayNy5Wp7Un6ph+uEEb81sUJemcaPSuxz7D0=;
        b=l/xHq67OfFBSFFkd8y7U1BNopqdt9royCWIjfMGlAeIGC32+a8kD86erpO8MqTgBMz
         55XoDhqOuvu3Zzcqz2LsFpk9b/ssadcvGfjdlzRDMRqXz0lAVJFo6PJTry+SNiYeIwKS
         H1v8k43nInhswe9mdSC8m5sLqmBlofN97y1MzE7T+i9B+NRAaKCtYUJaBJQ+0uOCUuZo
         jW3m0nGOgwbDGRj+tvEWK/8GylJzzsw81kcej7qP1kLGsqbboiLc3TvskbmCGUJXI+Co
         c2WgJJQFZ9rdJnN3CjrbLM8Pdnu5QoUqJmstAHSROg6H1GynSCKRc/DjoqErqLTHbkQ5
         i4jQ==
X-Gm-Message-State: APuU4Z/1Trj+/nLN5//0vqbkmZy7bQTSlCZDFr1uPq0CKrF9YR1Ze2eM
	1NnauOrF0Q7w4VAe9yFshqOn5znvzul8CXb4oMpOM2ViMW67FWmg8hbNjgLidlhtiUQ=
X-Gm-Gg: AYBFou0KMTYLFWlfXslpV0jIH+KYGKw+omHZR9Je/78YTBgmqLjAFK9GYWysTzpOc0D
	zyLesHolZBY07nd1/vShDHIyK+qkW4Qrz7TCPFqabyVMPrJZq4DZmQMlM/gHifMccCvQTHwHoY1
	ic8Nd0O70iKYtgA3WqNDaHkbphAbHcuPmd3vnvmO7BMg6/uQHy1ZCdsZqvHDOJ2TFX77RXC45Xl
	A+E0nTE4fcAa8jaLE62bpKotNjG1LPFLtAJphZEYrvTwcW7SF1Az5JKeGW848wfx7PjJGjyrssA
	kQTHPa9+zW+tg0TBxoBlv72O6GC1UCA2fAludNH9VDp+FqFVUh3LpAVcMVPKx7ERApx4CD0Blxu
	Uq0CQ6Ph5FoNVAqiFT168+Sn2vXQM5wns9/Js/iFOqi6zm35KYC1bLrHMHpahqs9BQxmMVTO8jp
	fmitdcjlDk5jc/UzCqa20AZU/3XxBbZOIlcxUTWAKUjQUw+R+lz71rkbVHcMO2UmWCjdiKbFXkH
	TTAoeJn9bMYsoEDXdXXMVAUodwaLd3uT6CCGU9cgutdIIRLU4nqK3NA+FFgLBxBw+Q2T/7EFxwn
	q2+gBNSvFONZltumfJUsswlqVIwv19nIzrdRMWGSF9dk0Bc=
X-Received: by 2002:a17:902:d2c4:b0:2e9:5507:b532 with SMTP id d9443c01a7336-2edd7a22279mr22643805ad.43.1794390409834;
        Wed, 11 Nov 2026 01:46:49 -0800 (PST)
Received: from buddy.corp.qihoo.net ([104.192.108.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6dd43bbsm18466175ad.57.2026.11.11.01.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:46:49 -0800 (PST)
From: Jun Yao <yaojun8558363@gmail.com>
To: netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	steffen.klassert@secunet.com,
	herbert@gondor.apana.org.au,
	dsahern@kernel.org,
	idosch@nvidia.com,
	Jun Yao <yaojun8558363@gmail.com>
Subject: [PATCH] xfrm: avoid stale tunnel pointers in deferred input callbacks
Date: Wed, 11 Nov 2026 17:46:29 +0800
Message-ID: <20261111094629.230568-1-yaojun8558363@gmail.com>
X-Mailer: git-send-email 2.43.0
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

IP-TFS input can be deferred while its reordering queue waits for a missing
sequence number. The VTI receive callback stores a pointer to the tunnel in
skb->cb, and the device can be removed and freed before the callback runs.

Keep only scalar tunnel metadata in an skb extension. The VTI callbacks
look up the device by ifindex under RCU and check its link configuration
before using its private data. If the VTI no longer exists, drop the
deferred packet. Use the same metadata to preserve tunnel mark handling
and IPv6 tunnel detection, and clear it when a new XFRM receive path starts
and after the callback completes.

Signed-off-by: Jun Yao <yaojun8558363@gmail.com>

---
diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index 6787fcf6a..f97412b95 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -5044,6 +5044,7 @@ enum skb_ext_id {
 #endif
 #ifdef CONFIG_XFRM
 	SKB_EXT_SEC_PATH,
+	SKB_EXT_XFRM_TUNNEL,
 #endif
 #if IS_ENABLED(CONFIG_NET_TC_SKB_EXT)
 	TC_SKB_EXT,
diff --git a/include/net/xfrm.h b/include/net/xfrm.h
index 445223a8d..defdd4088 100644
--- a/include/net/xfrm.h
+++ b/include/net/xfrm.h
@@ -382,6 +382,7 @@ struct xfrm_dst_lookup_params {
 };
 
 struct net_device;
+struct ip6_tnl;
 struct xfrm_type;
 struct xfrm_dst;
 struct xfrm_policy_afinfo {
@@ -740,14 +741,52 @@ struct xfrm_tunnel_skb_cb {
 		struct inet_skb_parm h4;
 		struct inet6_skb_parm h6;
 	} header;
+	/* Keep the layout of the other XFRM skb control blocks stable. */
+	unsigned long reserved;
+};
+
+enum xfrm_tunnel_info_type {
+	XFRM_TUNNEL_INFO_VTI4,
+	XFRM_TUNNEL_INFO_VTI6,
+	XFRM_TUNNEL_INFO_IP6,
+};
 
+/* Stored in an skb extension so it survives asynchronous XFRM input. */
+struct xfrm_tunnel_info {
+	int ifindex;
+	__be32 i_key;
+	u8 type;
 	union {
-		struct ip_tunnel *ip4;
-		struct ip6_tnl *ip6;
-	} tunnel;
+		struct {
+			int link;
+			__be32 saddr;
+			__be32 daddr;
+		} ip4;
+		struct {
+			int link;
+			u8 proto;
+			struct in6_addr laddr;
+			struct in6_addr raddr;
+		} ip6;
+	};
 };
 
-#define XFRM_TUNNEL_SKB_CB(__skb) ((struct xfrm_tunnel_skb_cb *)&((__skb)->cb[0]))
+static inline struct xfrm_tunnel_info *
+xfrm_tunnel_info_add(struct sk_buff *skb)
+{
+	return skb_ext_add(skb, SKB_EXT_XFRM_TUNNEL);
+}
+
+static inline const struct xfrm_tunnel_info *
+xfrm_tunnel_info(const struct sk_buff *skb)
+{
+	return skb_ext_find(skb, SKB_EXT_XFRM_TUNNEL);
+}
+
+static inline void xfrm_tunnel_info_clear(struct sk_buff *skb)
+{
+	skb_ext_del(skb, SKB_EXT_XFRM_TUNNEL);
+}
 
 /*
  * This structure is used for the duration where packets are being
@@ -1851,7 +1890,7 @@ int xfrm4_rcv(struct sk_buff *skb);
 
 static inline int xfrm4_rcv_spi(struct sk_buff *skb, int nexthdr, __be32 spi)
 {
-	XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4 = NULL;
+	xfrm_tunnel_info_clear(skb);
 	XFRM_SPI_SKB_CB(skb)->family = AF_INET;
 	XFRM_SPI_SKB_CB(skb)->daddroff = offsetof(struct iphdr, daddr);
 	return xfrm_input(skb, nexthdr, spi, 0);
@@ -2300,15 +2339,17 @@ static inline int xfrm_if_id_put(struct sk_buff *skb, __u32 if_id)
 static inline int xfrm_tunnel_check(struct sk_buff *skb, struct xfrm_state *x,
 				    unsigned int family)
 {
+	const struct xfrm_tunnel_info *info = xfrm_tunnel_info(skb);
 	bool tunnel = false;
 
 	switch(family) {
 	case AF_INET:
-		if (XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4)
+		if (info && info->type == XFRM_TUNNEL_INFO_VTI4)
 			tunnel = true;
 		break;
 	case AF_INET6:
-		if (XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6)
+		if (info && (info->type == XFRM_TUNNEL_INFO_VTI6 ||
+			     info->type == XFRM_TUNNEL_INFO_IP6))
 			tunnel = true;
 		break;
 	}
diff --git a/net/core/skbuff.c b/net/core/skbuff.c
index 8da53d5b7..32f41370d 100644
--- a/net/core/skbuff.c
+++ b/net/core/skbuff.c
@@ -5241,6 +5241,7 @@ static const u8 skb_ext_type_len[] = {
 #endif
 #ifdef CONFIG_XFRM
 	[SKB_EXT_SEC_PATH] = SKB_EXT_CHUNKSIZEOF(struct sec_path),
+	[SKB_EXT_XFRM_TUNNEL] = SKB_EXT_CHUNKSIZEOF(struct xfrm_tunnel_info),
 #endif
 #if IS_ENABLED(CONFIG_NET_TC_SKB_EXT)
 	[TC_SKB_EXT] = SKB_EXT_CHUNKSIZEOF(struct tc_skb_ext),
diff --git a/net/ipv4/esp4_offload.c b/net/ipv4/esp4_offload.c
index abd77162f..fa0a2a73b 100644
--- a/net/ipv4/esp4_offload.c
+++ b/net/ipv4/esp4_offload.c
@@ -81,7 +81,7 @@ static struct sk_buff *esp4_gro_receive(struct list_head *head,
 	if (NAPI_GRO_CB(skb)->proto == IPPROTO_UDP)
 		encap_type = UDP_ENCAP_ESPINUDP;
 
-	XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4 = NULL;
+	xfrm_tunnel_info_clear(skb);
 	XFRM_SPI_SKB_CB(skb)->family = AF_INET;
 	XFRM_SPI_SKB_CB(skb)->daddroff = offsetof(struct iphdr, daddr);
 	XFRM_SPI_SKB_CB(skb)->seq = seq;
diff --git a/net/ipv4/ip_vti.c b/net/ipv4/ip_vti.c
index c4f14d42d..3594254df 100644
--- a/net/ipv4/ip_vti.c
+++ b/net/ipv4/ip_vti.c
@@ -58,10 +58,25 @@ static int vti_input(struct sk_buff *skb, int nexthdr, __be32 spi,
 	tunnel = ip_tunnel_lookup(itn, skb->dev->ifindex, flags,
 				  iph->saddr, iph->daddr, 0);
 	if (tunnel) {
+		struct xfrm_tunnel_info *info;
+
 		if (!xfrm4_policy_check(NULL, XFRM_POLICY_IN, skb))
 			goto drop;
 
-		XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4 = tunnel;
+		info = xfrm_tunnel_info_add(skb);
+		if (!info)
+			goto drop;
+
+		*info = (struct xfrm_tunnel_info) {
+			.ifindex = tunnel->dev->ifindex,
+			.i_key = tunnel->parms.i_key,
+			.type = XFRM_TUNNEL_INFO_VTI4,
+			.ip4 = {
+				.link = tunnel->parms.link,
+				.saddr = tunnel->parms.iph.saddr,
+				.daddr = tunnel->parms.iph.daddr,
+			},
+		};
 
 		if (update_skb_dev)
 			skb->dev = tunnel->dev;
@@ -96,18 +111,28 @@ static int vti_rcv_proto(struct sk_buff *skb)
 
 static int vti_rcv_cb(struct sk_buff *skb, int err)
 {
+	const struct xfrm_tunnel_info *info = xfrm_tunnel_info(skb);
 	unsigned short family;
 	struct net_device *dev;
 	struct xfrm_state *x;
 	const struct xfrm_mode *inner_mode;
-	struct ip_tunnel *tunnel = XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4;
+	struct ip_tunnel *tunnel;
 	u32 orig_mark = skb->mark;
 	int ret;
 
-	if (!tunnel)
+	if (!info || info->type != XFRM_TUNNEL_INFO_VTI4)
 		return 1;
 
-	dev = tunnel->dev;
+	dev = dev_get_by_index_rcu(dev_net(skb->dev), info->ifindex);
+	if (!dev || dev->rtnl_link_ops != &vti_link_ops)
+		return err ? 1 : -ENODEV;
+
+	tunnel = netdev_priv(dev);
+	if (tunnel->parms.i_key != info->i_key ||
+	    tunnel->parms.link != info->ip4.link ||
+	    tunnel->parms.iph.saddr != info->ip4.saddr ||
+	    tunnel->parms.iph.daddr != info->ip4.daddr)
+		return err ? 1 : -ENODEV;
 
 	if (err) {
 		DEV_STATS_INC(dev, rx_errors);
@@ -131,7 +156,7 @@ static int vti_rcv_cb(struct sk_buff *skb, int err)
 
 	family = inner_mode->family;
 
-	skb->mark = be32_to_cpu(tunnel->parms.i_key);
+	skb->mark = be32_to_cpu(info->i_key);
 	ret = xfrm_policy_check(NULL, XFRM_POLICY_IN, skb, family);
 	skb->mark = orig_mark;
 
diff --git a/net/ipv4/xfrm4_protocol.c b/net/ipv4/xfrm4_protocol.c
index 4ee624d8e..c31426ea8 100644
--- a/net/ipv4/xfrm4_protocol.c
+++ b/net/ipv4/xfrm4_protocol.c
@@ -65,7 +65,7 @@ int xfrm4_rcv_encap(struct sk_buff *skb, int nexthdr, __be32 spi,
 	struct xfrm4_protocol *handler;
 	struct xfrm4_protocol __rcu **head = proto_handlers(nexthdr);
 
-	XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4 = NULL;
+	xfrm_tunnel_info_clear(skb);
 	XFRM_SPI_SKB_CB(skb)->family = AF_INET;
 	XFRM_SPI_SKB_CB(skb)->daddroff = offsetof(struct iphdr, daddr);
 
@@ -98,7 +98,7 @@ static int xfrm4_esp_rcv(struct sk_buff *skb)
 	int ret;
 	struct xfrm4_protocol *handler;
 
-	XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4 = NULL;
+	xfrm_tunnel_info_clear(skb);
 
 	for_each_protocol_rcu(esp4_handlers, handler)
 		if ((ret = handler->handler(skb)) != -EINVAL)
@@ -126,7 +126,7 @@ static int xfrm4_ah_rcv(struct sk_buff *skb)
 	int ret;
 	struct xfrm4_protocol *handler;
 
-	XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4 = NULL;
+	xfrm_tunnel_info_clear(skb);
 
 	for_each_protocol_rcu(ah4_handlers, handler)
 		if ((ret = handler->handler(skb)) != -EINVAL)
@@ -154,7 +154,7 @@ static int xfrm4_ipcomp_rcv(struct sk_buff *skb)
 	int ret;
 	struct xfrm4_protocol *handler;
 
-	XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4 = NULL;
+	xfrm_tunnel_info_clear(skb);
 
 	for_each_protocol_rcu(ipcomp4_handlers, handler)
 		if ((ret = handler->handler(skb)) != -EINVAL)
diff --git a/net/ipv6/esp6_offload.c b/net/ipv6/esp6_offload.c
index 22895521a..00cdae2c7 100644
--- a/net/ipv6/esp6_offload.c
+++ b/net/ipv6/esp6_offload.c
@@ -110,7 +110,7 @@ static struct sk_buff *esp6_gro_receive(struct list_head *head,
 		goto out;
 
 	IP6CB(skb)->nhoff = nhoff;
-	XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6 = NULL;
+	xfrm_tunnel_info_clear(skb);
 	XFRM_SPI_SKB_CB(skb)->family = AF_INET6;
 	XFRM_SPI_SKB_CB(skb)->daddroff = offsetof(struct ipv6hdr, daddr);
 	XFRM_SPI_SKB_CB(skb)->seq = seq;
diff --git a/net/ipv6/ip6_vti.c b/net/ipv6/ip6_vti.c
index c79027839..6cf40b000 100644
--- a/net/ipv6/ip6_vti.c
+++ b/net/ipv6/ip6_vti.c
@@ -302,6 +302,8 @@ static int vti6_input_proto(struct sk_buff *skb, int nexthdr, __be32 spi,
 	rcu_read_lock();
 	t = vti6_tnl_lookup(dev_net(skb->dev), &ipv6h->saddr, &ipv6h->daddr);
 	if (t) {
+		struct xfrm_tunnel_info *info;
+
 		if (t->parms.proto != IPPROTO_IPV6 && t->parms.proto != 0) {
 			rcu_read_unlock();
 			goto discard;
@@ -319,9 +321,26 @@ static int vti6_input_proto(struct sk_buff *skb, int nexthdr, __be32 spi,
 			goto discard;
 		}
 
+		info = xfrm_tunnel_info_add(skb);
+		if (!info) {
+			rcu_read_unlock();
+			goto discard;
+		}
+
+		*info = (struct xfrm_tunnel_info) {
+			.ifindex = t->dev->ifindex,
+			.i_key = t->parms.i_key,
+			.type = XFRM_TUNNEL_INFO_VTI6,
+			.ip6 = {
+				.link = t->parms.link,
+				.proto = t->parms.proto,
+				.laddr = t->parms.laddr,
+				.raddr = t->parms.raddr,
+			},
+		};
+
 		rcu_read_unlock();
 
-		XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6 = t;
 		XFRM_SPI_SKB_CB(skb)->family = AF_INET6;
 		XFRM_SPI_SKB_CB(skb)->daddroff = offsetof(struct ipv6hdr, daddr);
 		return xfrm_input(skb, nexthdr, spi, encap_type);
@@ -342,18 +361,29 @@ static int vti6_rcv(struct sk_buff *skb)
 
 static int vti6_rcv_cb(struct sk_buff *skb, int err)
 {
+	const struct xfrm_tunnel_info *info = xfrm_tunnel_info(skb);
 	unsigned short family;
 	struct net_device *dev;
 	struct xfrm_state *x;
 	const struct xfrm_mode *inner_mode;
-	struct ip6_tnl *t = XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6;
+	struct ip6_tnl *t;
 	u32 orig_mark = skb->mark;
 	int ret;
 
-	if (!t)
+	if (!info || info->type != XFRM_TUNNEL_INFO_VTI6)
 		return 1;
 
-	dev = t->dev;
+	dev = dev_get_by_index_rcu(dev_net(skb->dev), info->ifindex);
+	if (!dev || dev->rtnl_link_ops != &vti6_link_ops)
+		return err ? 1 : -ENODEV;
+
+	t = netdev_priv(dev);
+	if (t->parms.i_key != info->i_key ||
+	    t->parms.link != info->ip6.link ||
+	    t->parms.proto != info->ip6.proto ||
+	    !ipv6_addr_equal(&t->parms.laddr, &info->ip6.laddr) ||
+	    !ipv6_addr_equal(&t->parms.raddr, &info->ip6.raddr))
+		return err ? 1 : -ENODEV;
 
 	if (err) {
 		DEV_STATS_INC(dev, rx_errors);
@@ -377,7 +407,7 @@ static int vti6_rcv_cb(struct sk_buff *skb, int err)
 
 	family = inner_mode->family;
 
-	skb->mark = be32_to_cpu(t->parms.i_key);
+	skb->mark = be32_to_cpu(info->i_key);
 	ret = xfrm_policy_check(NULL, XFRM_POLICY_IN, skb, family);
 	skb->mark = orig_mark;
 
diff --git a/net/ipv6/xfrm6_input.c b/net/ipv6/xfrm6_input.c
index 07edef258..9aed0b21d 100644
--- a/net/ipv6/xfrm6_input.c
+++ b/net/ipv6/xfrm6_input.c
@@ -15,6 +15,7 @@
 #include <linux/netfilter.h>
 #include <linux/netfilter_ipv6.h>
 #include <net/ipv6.h>
+#include <net/ip6_tunnel.h>
 #include <net/xfrm.h>
 #include <net/protocol.h>
 #include <net/gro.h>
@@ -22,7 +23,28 @@
 int xfrm6_rcv_spi(struct sk_buff *skb, int nexthdr, __be32 spi,
 		  struct ip6_tnl *t)
 {
-	XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6 = t;
+	struct xfrm_tunnel_info *info;
+
+	xfrm_tunnel_info_clear(skb);
+	if (t) {
+		info = xfrm_tunnel_info_add(skb);
+		if (!info) {
+			kfree_skb(skb);
+			return 0;
+		}
+
+		*info = (struct xfrm_tunnel_info) {
+			.ifindex = t->dev->ifindex,
+			.i_key = t->parms.i_key,
+			.type = XFRM_TUNNEL_INFO_IP6,
+			.ip6 = {
+				.link = t->parms.link,
+				.proto = t->parms.proto,
+				.laddr = t->parms.laddr,
+				.raddr = t->parms.raddr,
+			},
+		};
+	}
 	XFRM_SPI_SKB_CB(skb)->family = AF_INET6;
 	XFRM_SPI_SKB_CB(skb)->daddroff = offsetof(struct ipv6hdr, daddr);
 	return xfrm_input(skb, nexthdr, spi, 0);
diff --git a/net/ipv6/xfrm6_protocol.c b/net/ipv6/xfrm6_protocol.c
index 9b586fcec..2e93029a3 100644
--- a/net/ipv6/xfrm6_protocol.c
+++ b/net/ipv6/xfrm6_protocol.c
@@ -66,7 +66,7 @@ int xfrm6_rcv_encap(struct sk_buff *skb, int nexthdr, __be32 spi,
 	struct xfrm6_protocol *handler;
 	struct xfrm6_protocol __rcu **head = proto_handlers(nexthdr);
 
-	XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6 = NULL;
+	xfrm_tunnel_info_clear(skb);
 	XFRM_SPI_SKB_CB(skb)->family = AF_INET6;
 	XFRM_SPI_SKB_CB(skb)->daddroff = offsetof(struct ipv6hdr, daddr);
 
@@ -113,7 +113,7 @@ static int xfrm6_esp_rcv(struct sk_buff *skb)
 	int ret;
 	struct xfrm6_protocol *handler;
 
-	XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6 = NULL;
+	xfrm_tunnel_info_clear(skb);
 
 	for_each_protocol_rcu(esp6_handlers, handler)
 		if ((ret = handler->handler(skb)) != -EINVAL)
@@ -142,7 +142,7 @@ static int xfrm6_ah_rcv(struct sk_buff *skb)
 	int ret;
 	struct xfrm6_protocol *handler;
 
-	XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6 = NULL;
+	xfrm_tunnel_info_clear(skb);
 
 	for_each_protocol_rcu(ah6_handlers, handler)
 		if ((ret = handler->handler(skb)) != -EINVAL)
@@ -171,7 +171,7 @@ static int xfrm6_ipcomp_rcv(struct sk_buff *skb)
 	int ret;
 	struct xfrm6_protocol *handler;
 
-	XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6 = NULL;
+	xfrm_tunnel_info_clear(skb);
 
 	for_each_protocol_rcu(ipcomp6_handlers, handler)
 		if ((ret = handler->handler(skb)) != -EINVAL)
diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
index 5ed87d513..a5d67d506 100644
--- a/net/xfrm/xfrm_input.c
+++ b/net/xfrm/xfrm_input.c
@@ -466,6 +466,7 @@ static int xfrm_inner_mode_input(struct xfrm_state *x,
 int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 {
 	const struct xfrm_state_afinfo *afinfo;
+	const struct xfrm_tunnel_info *tunnel_info;
 	struct net *net = dev_net(skb->dev);
 	struct net_device *dev = skb->dev;
 	int err;
@@ -555,16 +556,20 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 	}
 
 	family = XFRM_SPI_SKB_CB(skb)->family;
+	tunnel_info = xfrm_tunnel_info(skb);
 
 	/* if tunnel is present override skb->mark value with tunnel i_key */
 	switch (family) {
 	case AF_INET:
-		if (XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4)
-			mark = be32_to_cpu(XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4->parms.i_key);
+		if (tunnel_info &&
+		    tunnel_info->type == XFRM_TUNNEL_INFO_VTI4)
+			mark = be32_to_cpu(tunnel_info->i_key);
 		break;
 	case AF_INET6:
-		if (XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6)
-			mark = be32_to_cpu(XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6->parms.i_key);
+		if (tunnel_info &&
+		    (tunnel_info->type == XFRM_TUNNEL_INFO_VTI6 ||
+		     tunnel_info->type == XFRM_TUNNEL_INFO_IP6))
+			mark = be32_to_cpu(tunnel_info->i_key);
 		break;
 	}
 
@@ -739,6 +744,7 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 		goto drop;
 	}
 
+	xfrm_tunnel_info_clear(skb);
 	nf_reset_ct(skb);
 
 	if (decaps) {
diff --git a/net/xfrm/xfrm_interface_core.c b/net/xfrm/xfrm_interface_core.c
index 9835fbe63..d91b5f22d 100644
--- a/net/xfrm/xfrm_interface_core.c
+++ b/net/xfrm/xfrm_interface_core.c
@@ -322,10 +322,10 @@ static int xfrmi_input(struct sk_buff *skb, int nexthdr, __be32 spi,
 	XFRM_SPI_SKB_CB(skb)->family = family;
 	if (family == AF_INET) {
 		XFRM_SPI_SKB_CB(skb)->daddroff = offsetof(struct iphdr, daddr);
-		XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip4 = NULL;
+		xfrm_tunnel_info_clear(skb);
 	} else {
 		XFRM_SPI_SKB_CB(skb)->daddroff = offsetof(struct ipv6hdr, daddr);
-		XFRM_TUNNEL_SKB_CB(skb)->tunnel.ip6 = NULL;
+		xfrm_tunnel_info_clear(skb);
 	}
 
 	return xfrm_input(skb, nexthdr, spi, encap_type);

