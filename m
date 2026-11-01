Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793551358;
	b=g6dHXN2NtikpsdLqrhQp1F5NqAsN8sQs71U5/JmhxrnYPFnvnnm9SMcC+zqNYhIoq6Mn
	 ghjexs6MLmrJ1d2dS2wQaLeuboxx1QURjw+bwKZ6x6L9XiLxwmuB1TVUf/6n96QgF7D0z
	 e3SV28OtMgMCmzMwDe3gEee+pwOpGK3Ar27CbG5fPBbnN6nA4oZhGUoEsezsuh42hLy8g
	 r/QerPaWaknLhoQsqQul8l8H/OWQQHCc7WfUreTSLGYtuvunD/pssNcQZNFXdANahiWR+
	 Qcl4urvbNhrwMInTqZQOrke/GLqIB0IjIqTd3f91ponl11zboYBWNsflyEKSx1UOV6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793551358;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TlraSu9AjY+wAsB7GZqoG24SclQpPomTr5qFhEYxo8U=;
	b=0XKkdCXo3OD0qyC8qdlsxVic5WOzR+K6hB6pJlG6c33rY7JaIJSJNTO+3p6v8gNS02jz
	 n0AZsGIsbRzZ+FRn53GLK+a8d6PeKbBAgt4kQujhYIAVbtJRCXExCa+cdNDVm80NOBLj+
	 GBCJLHoBnEjzQTNQF67PzE9LcEaEuOtnUODRIqR/lV7gsXf48BlkDep+G7kWFffy04bf7
	 Tb09U2JS8EnZCoMS4oQOuZzNfXYfi9NO3p00kpDmOoS6XVocnbL70a7UR8INDwVs2Z1kc
	 JGP9Hfuk4y/BUYjpZazmoFKF4nUIppHvhay0KqDjLbLL2F1aNwspBHjwPYUYXMLdOvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=t+WLQy0B;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7D560A261A
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 16:42:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D7D560A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=t+WLQy0B
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c46822eefb6so300849566b.2
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 08:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1793551357; x=1794156157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TlraSu9AjY+wAsB7GZqoG24SclQpPomTr5qFhEYxo8U=;
        b=t+WLQy0BSuGtr5MwiFW+b4clPwk3wSTjU+5yXt6LJzMFRj3AbwtXZNjZ5yqwM+6/5U
         r6RcbLa9SB0RIU/FmeukHD7Qsh/SPhmC04PJX9Be898pt4rhAqumfA/NKiDz/sp42awz
         7umJQaQBwZgek5PWiM73Jq5fCjyM7Vja9ncJVOgbR97aDYVe/3tpQ2qfX3vRZ+BIahAo
         sWJlShjct0wAwCegAVO9OXOq7MCCSMrq10k7M+pTL712SEvwNLV/i6zh3FiXe1feCDU9
         MHsrD81qz252LKeme69QIcEv6mqWoDmcdXqGrEcoCR74fiZRK53WULOdT1Co588B6Dii
         eNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793551357; x=1794156157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TlraSu9AjY+wAsB7GZqoG24SclQpPomTr5qFhEYxo8U=;
        b=qafbM2eu2vf4OqX5SdtIo9rhMNtxZDd9d1JdRnOZvXKMLEur6psnnlSh5T1+ILob4E
         8ZF/5ks4FUi3A0z2kEviFAmoMg0oW5SCsmjf802sMoRFgpEGmWfQ/nGt/imdtz8dpLuR
         QjYm++qmRNdK4EYYP9Mvh5dGuRPHJsQUPX/aPA2/Bvptc5Ni/RFzvzVAfsevLcqtUSyy
         VlFo2Cu/JSLbpOQ/dhsT/63cTdfYcE8aBh/p66gzSLarucezgmkmhLzOR80Xy48UGx14
         BGYuwdsdbAlGIdBURSjcyG8il4Lvlqlk5vUmXD+O/yUtp0cnEJAs8139yINU6mpZ2x81
         Gjhg==
X-Forwarded-Encrypted: i=1; AKwUvBwZeFVnYYcc1+IPes4SxrIWUYAGGNXSTA+KQG+egvbVaNCJ1dKoc5MmWQ9uHTWahQQ9kc+t/QII6ixUpiE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNvRNoVfS/UWikPxHVG4ht5GQD/iKXn8jcVoQunIX1rlK8V8cN
	0ENPGj1luMzGTZ28N+5p7gRYc5Yo0S43jjBZ9z2dazhMqlK7zFcoiH4YyBYawaND5Q==
X-Gm-Gg: AYBFou28fyPG1174FDPs05ZFRFTR6kHjNMyWn7FZIH+nn8HVz3B7p5GRNXe8EEatLwu
	WbPko4+RF3nHENWUfxETbJEZceQ1E1yy7e6aD6apkLGF43bgtrvAKT/XD8EwiliY8pEeibnBUMg
	7BhRycohihtTRD+tvBZCRYqEUTAL4Hxkpi51VrDofAyreQq4sCD2PYzN3pmW+pSCRWb4jtOeCB5
	r4L3/a3TtzNBloeY9gGSIYxCYO+IybsihfLfBgDkQmI0zVqcE0F8Qq2PKUhtgac2ZTOWGWKGaiA
	lOOSCMI0cVsXYKp/ILqmV3/yZTxKIkEcoKMHGzsPG3HXaTdkN8szNDdogwXS7aqLU0Yh2sHm5ei
	gVzXrWL8WJ7+UjkyKV4TH8iu4NJyDg7CPVTPHBwk2ZycQ3zfTHLsvn2DmZzxBj3gH7C43Ez0GmZ
	0lFdoe/iN/gxJ95ReFydCG/gnvFv9C3vGY9bckTqEeht/nfX/wcvJZ5C6auI/47RvbVLH+06f0v
	Yr+wN/cXWOBVFit5eHhMKs3Sdci6DRl6H7RXhYC31plJ+oNVk5L5XQcrG4ZHLwDeShH2uxGjXB4
	dNlFkx/fqlH1OCc+dZ9mQDBi6nF+UAXzszrEQgNAbM90dxpe/1qCElqAb5Li8f3lFH6RrnIWM/X
	f1aHRhfH13L3w8Azwpg+j+4nuTkc3HVVj/3R0wP24zsnj3W05kfnVkpjPF1Jabl35B8zqKMQuzg
	qdeG1xwkXLHAhapETmdecdozv9xUPtx3qUqcvYkdTSZeVzJbUx/dxN/zGBmrsbXjXwmEGk9rU5h
	MMLzClgTZM9+IBRorzJycfAlbpcFEvBeuK9A2BDFt9c4h/uwvSkr0uNt1+/9RKY7s5PqZStmvKK
	+O3Rz+z8xeCpw6vXn0s=
X-Received: by 2002:a17:907:2d8e:b0:c42:102f:15df with SMTP id a640c23a62f3a-c4ca7a0dc8cmr673791066b.8.1793551356711;
        Sun, 01 Nov 2026 08:42:36 -0800 (PST)
Received: from Desktop (p54aff88b.dip0.t-ipconnect.de. [84.175.248.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe0f37esm296622966b.33.2026.11.01.08.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 08:42:36 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: dsahern@kernel.org,
	idosch@nvidia.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	steffen.klassert@secunet.com,
	willemb@google.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v4 3/4] ipmr: set up GSO state for tunnel vifs
Date: Sun,  1 Nov 2026 17:42:31 +0100
Message-ID: <529dd7ba1395f17c0b328ab2a597769809cbe720.1792838740.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1792838740.git.julius@bairaktaris.de>
References: <cover.1792838740.git.julius@bairaktaris.de>
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

ip_encap() pushes the outer IPv4 header but does not set SKB_GSO_IPXIP4,
skb->encapsulation or the inner headers. A GSO packet forwarded to a
VIFF_TUNNEL vif is then rejected by ipip_gso_segment() and dropped in
validate_xmit_skb(), after being counted as sent. A device with UDP
segmentation offload is handed a GSO packet whose transport header
points at the inner IP header.

Call iptunnel_handle_offloads() and skb_set_inner_ipproto() as
ipip_tunnel_xmit() does, reserve one outer IP ID per segment as
iptunnel_xmit() does, and set the outer length with iph_set_totlen(),
since a GSO packet plus the outer header can exceed 64 KB. A GSO packet
that GRE or UDP tunnel GRO marked as encapsulated already uses the inner
headers for its own tunnel; drop it, as segmentation did before.

Fixes: 9fd1ff5d2ac7 ("udp: Support UDP fraglist GRO/GSO.")
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/ipv4/ipmr.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index acacaae05cc49..98e38839f8ccb 100644
--- a/net/ipv4/ipmr.c
+++ b/net/ipv4/ipmr.c
@@ -1849,12 +1849,21 @@ static struct notifier_block ip_mr_notifier = {
  * This avoids tunnel drivers and other mess and gives us the speed so
  * important for multicast video.
  */
-static void ip_encap(struct net *net, struct sk_buff *skb,
-		     __be32 saddr, __be32 daddr)
+static int ip_encap(struct net *net, struct sk_buff *skb,
+		    __be32 saddr, __be32 daddr)
 {
+	const struct iphdr *old_iph;
 	struct iphdr *iph;
-	const struct iphdr *old_iph = ip_hdr(skb);
 
+	/* The inner headers can describe one tunnel only */
+	if (skb_is_gso(skb) && skb->encapsulation)
+		return -1;
+
+	if (iptunnel_handle_offloads(skb, SKB_GSO_IPXIP4))
+		return -1;
+	skb_set_inner_ipproto(skb, IPPROTO_IPIP);
+
+	old_iph = ip_hdr(skb);
 	skb_push(skb, sizeof(struct iphdr));
 	skb->transport_header = skb->network_header;
 	skb_reset_network_header(skb);
@@ -1868,12 +1877,13 @@ static void ip_encap(struct net *net, struct sk_buff *skb,
 	iph->saddr	=	saddr;
 	iph->protocol	=	IPPROTO_IPIP;
 	iph->ihl	=	5;
-	iph->tot_len	=	htons(skb->len);
-	ip_select_ident(net, skb, NULL);
+	iph_set_totlen(iph, skb->len);
+	ip_select_ident_segs(net, skb, NULL, skb_shinfo(skb)->gso_segs ?: 1);
 	ip_send_check(iph);
 
 	memset(&(IPCB(skb)->opt), 0, sizeof(IPCB(skb)->opt));
 	nf_reset_ct(skb);
+	return 0;
 }
 
 static inline int ipmr_forward_finish(struct net *net, struct sock *sk,
@@ -1982,7 +1992,8 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
 	 * What do we do with netfilter? -- RR
 	 */
 	if (vif->flags & VIFF_TUNNEL) {
-		ip_encap(net, skb, vif->local, vif->remote);
+		if (ip_encap(net, skb, vif->local, vif->remote))
+			return -1;
 		/* FIXME: extra output firewall step used to be here. --RR */
 		DEV_STATS_INC(vif_dev, tx_packets);
 		DEV_STATS_ADD(vif_dev, tx_bytes, skb->len);
-- 
2.53.0

