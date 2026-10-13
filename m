Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE4D4E80B6
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 10:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791889136; cv=none; b=txueubuov2hhSzmgMjtHQKAv5kv7AFrgGh9ao9eXmfSIX4FCWrDMrHVDW67x+EPuDvzvO5FLozDtPB1qZHR4IPYgO5/tTzxbrVJ1wBlP3AxCkUk7Kxrlmsxq9INL/m6jgCV1Z0t3kfLBebzpvWY4Q5/GrCr87CjM8P8u8LoGyTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791889136; c=relaxed/simple;
	bh=yPvbXQJO4g4fSdUPeHvPpxAec2+KPnTBizqvTfKMhnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dmSPcc6EiUkNurBWTMfrzZ3hHSicvHJOTL9kOCq9AfON9amO36nxbVCuqtQxMpNUGLdTPGai8Xz8ggyIrjPD0HocZnEc9AamwprDw1ZsYpTTgYrS3A0f7lrJmLwtYzZAW1uKnHpgvMV+DYAyQpF9TigfoNiJpkgyGvc7oyA/e7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lbaai3HW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CU5OgDn6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lbaai3HW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CU5OgDn6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791889126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Dq0crgc7vKDC3fZNlazsaBKXkICbHKAerCxw9oAOLWE=;
	b=Lbaai3HWHG362XLT3FWKgUazjhb3sW2rcCUCV61UZNW3Puag8ZsRDwXgSJqfMm0sNT6N9F
	DXANfTcJ78WLpJ58QtzrPB9JJPhr/k50oc4bxByMJKyHC6MUJsY1jUR++tzI7BQ3L+eKXb
	Q/wGKvMvG95FZvCHsETs+gNECICGhQI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-403-kHN0Si4kOT-86tq6PPmrMg-1; Tue, 13 Oct 2026 10:58:39 +0000
X-MC-Unique: kHN0Si4kOT-86tq6PPmrMg-1
X-Mimecast-MFC-AGG-ID: kHN0Si4kOT-86tq6PPmrMg_1791889118
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4994d67d0e3so18735045e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 03:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1791889118; x=1792493918; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dq0crgc7vKDC3fZNlazsaBKXkICbHKAerCxw9oAOLWE=;
        b=CU5OgDn6UnSIT0gDENA8E2efPUKSpP0DP+KWzP0TQrvkdKrvfc8gonbFrHgdnCVaZl
         BWuTlT1CrW2fxMEZumYAAb19C07twxXBHDgHsRDHoe5q1NA1cUtoUGoqnYM/ZCGRIUHR
         F2C7Fy3/H7ybSavaemPIBXF8VfEPDSgYRcSpKEMcW6r23T7VM4wmzyyr/dPMslazveTi
         vhTb+ceGgsVCZxub6+RSMixL8kvlOvECi4K/0aAaNGSPsZwsSZdNDMwWOsP4X2l28hWA
         RGMVVmS/HOEU3AhDDc480/kRrr0qM0/CiGtUJmlkTDKPdeUXqMGz2qA1H48wE7zzykLm
         jQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791889118; x=1792493918;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dq0crgc7vKDC3fZNlazsaBKXkICbHKAerCxw9oAOLWE=;
        b=ZoZfXQ+0vkBoXeGyV51NE5j5krg18/jZvPOWdQlQhuuSidXtFVTKKoDADzmT5HjQGC
         mkcanpAkFRRLicQG3owk9QmTrIRxnhiyiMJ96AZc9WSFfd7/i19UNb5EGwd3U2zmrF5w
         5JyW4dt29wLy3AyMPJpKRWvJYEPCb+3dVKpUX9Ts/lHfHp13r62/Ghs4kbOYsYryV3Kz
         E3Smh6rKHF3vn77HM4wZWWvETYDlP23DdzxgV5tEP2Nl5M6Oleo7NG88mqrfuWbyqFGL
         vDdYbhJ9xfu8G+td7uYYwkGzZ/d+ZiF9U3pqI0npRjtNeJYRfrZcqH7MogtbvLMCEfJ3
         wM3A==
X-Gm-Message-State: AFq9FYL78SAZ7iniEJvtSFRGtf11MP0RlBdhCnNQlJJOhi9eHvDSNxLI
	2y75TZZtQ46v34lM3n2orOkSUzzU5gOfFP98NhDK5mIL22Lkzl99Ohx9J/49AZq8Ghv8/vSbsTA
	xqEGK1c5F1pLGUe1Usg9Mw+XQMzFh5lx0Se4kSIUtOBLE82UotHAXVkq09J0PfCMNjtva6UBi7j
	lNX06hmnz9Ldk3cQomm+GGMu/gBL3dSjSNK1CvFN6Bk64=
X-Gm-Gg: AYBFou1KrKot9KGbhtCkgGwT3zXSLBR7k788f1EgmSblEWqQ9D4sqx45jk4+/PgJe3L
	Fq3RncY/EBPOJtJoiSX5tIVffrQwt+Q8Xj+P17zVWCm+h0Z/UPsMA5sfBXKzxrZrhRJYhd5413q
	FPqdzws+NRVteTtuqkdyutdTxU8upwWo6biry5247qyXvYRMwWE2pgmrbmZynfVViTG6amqIFr4
	FfhpRrGXQ5SYdwfP8Jw5/qcsKNh4/Zf+KQPfa2tzOAo7Rq9IYrEs4DdgsSIBkAJm7KtxTNmCsMZ
	1IbT+SqwFbmgcDxBF+jd1brExzgGRQ9kgx7CfuXN9YSXKphkzIkJSb6jRj3hM8Q38PD9gg==
X-Received: by 2002:a05:600c:4e41:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-4a18e4d80bdmr231408585e9.33.1791889118045;
        Tue, 13 Oct 2026 03:58:38 -0700 (PDT)
X-Received: by 2002:a05:600c:4e41:b0:49f:c1a1:5222 with SMTP id 5b1f17b1804b1-4a18e4d80bdmr231407945e9.33.1791889117450;
        Tue, 13 Oct 2026 03:58:37 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:3fd7:5300:3d6b:52a4:a23f:9d0b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaac3esm4507970f8f.11.2026.10.13.03.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:58:35 -0700 (PDT)
Date: Tue, 13 Oct 2026 06:58:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, virtualization@lists.linux.dev,
	Max Krasnyansky <maxk@qualcomm.com>,
	Rusty Russell <rusty@rustcorp.com.au>,
	Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Ido Schimmel <idosch@nvidia.com>, Simon Horman <horms@kernel.org>,
	David Ahern <dsahern@kernel.org>, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, bridge@lists.linux.dev
Subject: [PATCH net-next 2/4] net: use ip4_parse() in receive validation
Message-ID: <05eb0a83a9975e8e042caeeb4fca5fad30e02fb4.1791887415.git.mst@redhat.com>
References: <cover.1791887415.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1791887415.git.mst@redhat.com>
X-Mailer: git-send-email 2.51.2.2891.g4157995a80.dirty
X-Mutt-Fcc: =sent

Convert the sites that pull and do version and ihl checks on the ipv4
header and validate the packet transport offset to use ip4_parse.

Sites that validate a read-only copy instead of pulling - the nft
and nft_inner header_pointer validators, ip_check_defrag()'s
skb_copy_bits, the flow dissector - stay open-coded for now.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Assisted-by: LLM
---
 net/bridge/br_netfilter_hooks.c     | 15 +++++----------
 net/ipv4/ip_input.c                 | 13 +++++--------
 net/ipv4/netfilter/nf_reject_ipv4.c | 13 +++++--------
 3 files changed, 15 insertions(+), 26 deletions(-)

diff --git a/net/bridge/br_netfilter_hooks.c b/net/bridge/br_netfilter_hooks.c
index 0a394e5f43916..e89da0e415426 100644
--- a/net/bridge/br_netfilter_hooks.c
+++ b/net/bridge/br_netfilter_hooks.c
@@ -206,18 +206,13 @@ static inline void nf_bridge_pull_encap_header_rcsum(struct sk_buff *skb)
 static int br_validate_ipv4(struct net *net, struct sk_buff *skb)
 {
 	const struct iphdr *iph;
-	u32 len;
+	u32 len, thoff;
 
-	if (!pskb_may_pull(skb, sizeof(struct iphdr)))
+	iph = ip4_parse(skb, 0, &thoff);
+	if (!iph)
 		goto inhdr_error;
 
-	iph = ip_hdr(skb);
-
-	/* Basic sanity checks */
-	if (iph->ihl < 5 || iph->version != 4)
-		goto inhdr_error;
-
-	if (!pskb_may_pull(skb, iph->ihl*4))
+	if (!pskb_may_pull(skb, thoff))
 		goto inhdr_error;
 
 	iph = ip_hdr(skb);
@@ -228,7 +223,7 @@ static int br_validate_ipv4(struct net *net, struct sk_buff *skb)
 	if (skb->len < len) {
 		__IP_INC_STATS(net, IPSTATS_MIB_INTRUNCATEDPKTS);
 		goto drop;
-	} else if (len < (iph->ihl*4))
+	} else if (len < thoff)
 		goto inhdr_error;
 
 	if (pskb_trim_rcsum(skb, len)) {
diff --git a/net/ipv4/ip_input.c b/net/ipv4/ip_input.c
index 9860178752b8c..5adf01763e857 100644
--- a/net/ipv4/ip_input.c
+++ b/net/ipv4/ip_input.c
@@ -500,7 +500,7 @@ static struct sk_buff *ip_rcv_core(struct sk_buff *skb, struct net *net)
 {
 	const struct iphdr *iph;
 	int drop_reason;
-	u32 len;
+	u32 len, thoff;
 
 	/* When the interface is in promisc. mode, drop all the crap
 	 * that it receives, do not try to analyse it.
@@ -520,10 +520,6 @@ static struct sk_buff *ip_rcv_core(struct sk_buff *skb, struct net *net)
 	}
 
 	drop_reason = SKB_DROP_REASON_NOT_SPECIFIED;
-	if (!pskb_may_pull(skb, sizeof(struct iphdr)))
-		goto inhdr_error;
-
-	iph = ip_hdr(skb);
 
 	/*
 	 *	RFC1122: 3.2.1.2 MUST silently discard any IP frame that fails the checksum.
@@ -536,7 +532,8 @@ static struct sk_buff *ip_rcv_core(struct sk_buff *skb, struct net *net)
 	 *	4.	Doesn't have a bogus length
 	 */
 
-	if (iph->ihl < 5 || iph->version != 4)
+	iph = ip4_parse(skb, 0, &thoff);
+	if (!iph)
 		goto inhdr_error;
 
 	BUILD_BUG_ON(IPSTATS_MIB_ECT1PKTS != IPSTATS_MIB_NOECTPKTS + INET_ECN_ECT_1);
@@ -546,7 +543,7 @@ static struct sk_buff *ip_rcv_core(struct sk_buff *skb, struct net *net)
 		       IPSTATS_MIB_NOECTPKTS + (iph->tos & INET_ECN_MASK),
 		       max_t(unsigned short, 1, skb_shinfo(skb)->gso_segs));
 
-	if (!pskb_may_pull(skb, iph->ihl*4))
+	if (!pskb_may_pull(skb, thoff))
 		goto inhdr_error;
 
 	iph = ip_hdr(skb);
@@ -559,7 +556,7 @@ static struct sk_buff *ip_rcv_core(struct sk_buff *skb, struct net *net)
 		drop_reason = SKB_DROP_REASON_PKT_TOO_SMALL;
 		__IP_INC_STATS(net, IPSTATS_MIB_INTRUNCATEDPKTS);
 		goto drop;
-	} else if (len < (iph->ihl*4))
+	} else if (len < thoff)
 		goto inhdr_error;
 
 	/* Our transport medium may have padded the buffer out. Now we know it
diff --git a/net/ipv4/netfilter/nf_reject_ipv4.c b/net/ipv4/netfilter/nf_reject_ipv4.c
index 59ec465a9df98..42d639854ddf1 100644
--- a/net/ipv4/netfilter/nf_reject_ipv4.c
+++ b/net/ipv4/netfilter/nf_reject_ipv4.c
@@ -25,22 +25,19 @@ nf_reject_ip_tcphdr_get(struct sk_buff *oldskb,
 static int nf_reject_iphdr_validate(struct sk_buff *skb)
 {
 	struct iphdr *iph;
-	u32 len;
+	u32 len, thoff;
 
-	if (!pskb_may_pull(skb, sizeof(struct iphdr)))
-		return 0;
-
-	iph = ip_hdr(skb);
-	if (iph->ihl < 5 || iph->version != 4)
+	iph = ip4_parse(skb, 0, &thoff);
+	if (!iph)
 		return 0;
 
 	len = ntohs(iph->tot_len);
 	if (skb->len < len)
 		return 0;
-	else if (len < (iph->ihl*4))
+	else if (len < thoff)
 		return 0;
 
-	if (!pskb_may_pull(skb, iph->ihl*4))
+	if (!pskb_may_pull(skb, thoff))
 		return 0;
 
 	return 1;
-- 
MST

