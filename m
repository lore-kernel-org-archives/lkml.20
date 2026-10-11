Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACEA348445
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791736208; cv=none; b=RGaaM3oUBMlflKzymqYucSdkJXzjlfunkASQ0+AivG0kuVWmuiRiMnbD5dHjSQEd0CXidqBF+THAANHT3eoquK53SWMN/6hDoxd+LopooqHpesYRuZoVoN7u6NxE4S/YWnnx6GhqXaC6EocyZ36C8MrYlyMMcP1+dYT7sL9hTUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791736208; c=relaxed/simple;
	bh=WX8vHDmYmID6zeBr7+d02huHyl3ktS0CUyF+dqIWnWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JQGtzfv+MGze52yCuN4A954BK+/5wO3218gPHCALHEW7UqZHjRoLIMYXuveKZO+KLGu3huLjCoCrlHk7RHQ/US5sW+vE9w+O/VqVGFcHKq4GtW904js5KOnfzGP0XUdXU5w7VbS1DwVmJl2eHtGvovlE9yoFBy8A+2MOd0zN9ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=nWnpRSQw; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="nWnpRSQw"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-487049569b6so740823f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791736204; x=1792341004; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l5z1jnf6sSEmZnFFBuO6KI3hu21IqBP1eDhtrGsyWbc=;
        b=nWnpRSQwcWKLfFlN4ey8UigzdmAx2svWBUhSPk7RvxPfjSmP1g67chAUEp1sXzUWvg
         S1ISOJAZdsNhPJpg6IZvFYNtsrboGJoiCwuopEEj6IKFPc2M/aWGxPYSbC8J6A6Udmt7
         57wjbNAN+xWXNgd9LSFJm5HP7r9HF5TvKi9zqtFsO5Y5uG6ldk15u1z16xtBpi0ysBY+
         ZjBnmRFmC0UgLlAkGbjj6l4r+B7kKJcAOOxDWJQQjB0v/SQfG4sn7nYH9XRbaJqUWygi
         TWv6a+CZAIX2av1Piny/JCA4JRwTcv4k/K9RIjr3Q9CShJ/tOOpbbBQPf+JxjH3ivnKh
         ZoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791736205; x=1792341005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l5z1jnf6sSEmZnFFBuO6KI3hu21IqBP1eDhtrGsyWbc=;
        b=EJv1r47DETWz+i7FuqaL0kxsn4Mialu2Bc8ZwTGnBFJNG4sggTPCoN+H5ZkjZLPVz0
         9YA/g6KiP1I/hj6tcYsU+uvE8seCZKZRA7VMnwoorismJpHs42CKOBf+4RezAwRiLTkn
         K7oDnEf35GN72QbFAVWpBsr2dXqGy9vwpSTLR6MOCF7Bt3K+apqz8NEovJh6A7jlVvk0
         HuX5BuKz2eMAjno8IZs690sYUor5pi+GMoOtNj2VI3vxYmr3lTBjACoy91im1KJJZLsj
         9LardMOuoVmJuNRnlKwSWhyA1aBE8WVSofegqpPeamHnLQZ7rIJfzz0ZheOMeJDKv2pc
         7uGw==
X-Forwarded-Encrypted: i=1; AKwUvBzWoDjtCG4FbRv0SE7y4aJkTQeMmRHiwUMcpR7Kc0HBEFm5OImxEWeudwq/5w7njMWyc0lct1M43lgC10o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJN9CSGsMouMobR5SZDeFDhUTX3RVTQ1GXlCVtIs1ONXPu62ANv
	Ugw4wg+VbfTMgx6YX6e+cqW7txEhz3xhjiHGA00+tvPnLfUc2lOFsYDvuLZKI6acEA==
X-Gm-Gg: AYBFou1B0QIbedPD+hl29LxTAf71c8jr6K+Gj7lnf+Y+Uy5ZjKOKk/4lqDts3J97Mqg
	6rqUbfoAEVkXufNbA8bp3AHy0hjD0vheRrqnqTxUx9UrfhQP73poxNy/Yrkha7Ve3TYlNYRRX7N
	0a6Yjm0OG9NWLmIyFI1dvG1Y28PqMB8qm4Z4VDjyEl3a3fq9l4Rgnj4CSyqBiNd43rz2GkgXqL+
	O/8HhHYs23XGAiY0vC8BawUm7ZHSW8bN7lE1Bt8gOMzRMkQf2Au0p9XExevvg50TFGmecitQf0b
	6IjwhIa5Cvi1Hn2Yfh5n7w7gTthf2Y82fdXLmOa1RvutPrjb7X6J8mKDae81TaZu6N+JSoQGMbp
	QxQoBOgNdB/iHfr1QoAAFG1kGNRvKoZt0GEtMwzyDgm3kpk5VwWDG6j2LN1i6IAwSnHzj0H1imr
	Oc1jRVctaqgvqZhhJfUxkiZOWWnTuz0yS5oa+6IcZC/vHepVqSj8nyd4TL56RgduKaVIJjG6ztS
	gC6Tl48TPSKhnyC13GDTxXJxpR5VsnesvLkTV98YRrh5kGVOhiIyxrY3FuP2l17V53Ov2I1hNnV
	/w3BTTYt11Kia5+yd+HHk9SJpVqvXBdSVNV6lfrhTRki/yXG+aRLuBiauqfF3WZuvLrW+/C9mxS
	g7zwkqXOKBa6aqlpp4lgPsU7HCoNLimqkJi8csJRuU0TVWd9HTqiXfL2w/B5ain8nGaZigfOyCt
	NE1fc8Y11alMvvr4KHJNcJ5cEygDiCqQLCOl0St7aPBrPj4zab
X-Received: by 2002:a05:6000:299c:10b0:48a:fb3e:d93c with SMTP id ffacd0b85a97d-48dba784b80mr9543093f8f.5.1791736204398;
        Sun, 11 Oct 2026 09:30:04 -0700 (PDT)
Received: from Desktop.vpn.uni-hamburg.de (dhcp-40-52.vpn.uni-hamburg.de. [134.100.40.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acc936sm14657920f8f.44.2026.10.11.09.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 09:30:03 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 2/3] ipmr: set up GSO state for tunnel vifs
Date: Sun, 11 Oct 2026 18:29:56 +0200
Message-ID: <20261011162957.1328474-3-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011162957.1328474-1-julius@bairaktaris.de>
References: <20261011162957.1328474-1-julius@bairaktaris.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ip_encap() pushes the outer IPv4 header but does not set SKB_GSO_IPXIP4,
skb->encapsulation or the inner headers. A GSO packet forwarded to a
VIFF_TUNNEL vif is then rejected by ipip_gso_segment() and dropped in
validate_xmit_skb(), after being counted as sent. A device with UDP
segmentation offload is handed a GSO packet whose transport header
points at the inner IP header.

Call iptunnel_handle_offloads() and skb_set_inner_ipproto() as
ipip_tunnel_xmit() does.

Fixes: 9fd1ff5d2ac7 ("udp: Support UDP fraglist GRO/GSO.")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/ipv4/ipmr.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index b9c544d48c452..f0666749b14a7 100644
--- a/net/ipv4/ipmr.c
+++ b/net/ipv4/ipmr.c
@@ -1835,12 +1835,17 @@ static struct notifier_block ip_mr_notifier = {
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
 
+	if (iptunnel_handle_offloads(skb, SKB_GSO_IPXIP4))
+		return -1;
+	skb_set_inner_ipproto(skb, IPPROTO_IPIP);
+
+	old_iph = ip_hdr(skb);
 	skb_push(skb, sizeof(struct iphdr));
 	skb->transport_header = skb->network_header;
 	skb_reset_network_header(skb);
@@ -1860,6 +1865,7 @@ static void ip_encap(struct net *net, struct sk_buff *skb,
 
 	memset(&(IPCB(skb)->opt), 0, sizeof(IPCB(skb)->opt));
 	nf_reset_ct(skb);
+	return 0;
 }
 
 static inline int ipmr_forward_finish(struct net *net, struct sock *sk,
@@ -1968,7 +1974,8 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
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

