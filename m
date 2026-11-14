Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794680829;
	b=qPP246zFfMPuJ5V9GTlNi/43kDes/BqbieoZvNaTSrGxkaziOykJ1vzyvlBV4yD6DDLM
	 vjv/rAAz4mgF76j2nxaJFxsRRcjpgwmLJyDZeYnoakMQnTyg8R1wGMfBXukkD1WPQYcFr
	 0sx6+0j31mI536Ir1Ni6ALtplNhBnJ73M7QJZWy2C2XuejGNmDSBS2Kr6qHRDlZD0ubnM
	 i675YpxeNscbchVeUXrueuVTbE6+akHb31dQhzrZPJIKcwSyrLBZJJQKqxYUgq+k3+UCc
	 PpaEYxKSUmr9bbiR22zCB9NpXZNBs2aC2F6cjM0pYSnN+usOZg9GCTPgz5PSxDnIPIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794680829;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GT4NkxFHB1TI5wpt6+gzMiWqzYLveilDkJzsMTF0f6M=;
	b=bTlH7W5Cb+Laovt0rZfK69hZ3wiGpGPnykIAOzsJhI0RIBHO7BcfKGhHwC6BfKT65cgO
	 UeY4jQvg4w0K1M5fY3dFgVHTfhHAKm1pk9LiRKYeleC9iABoBTIgLrnoLLNqTiCYwXyqR
	 e5gSgMJ3SuT/7hDRifre5vOeNpD4aqHt1Ao1+k6MgzzNQhU5DogGdz2WE20LORFxTprui
	 FooqL9J1lazhWlIJV+Kci17WEV0i009bIqW3nLmEnPOkVREF0v6fZ6W047Y0LEAN1cEKk
	 4i/mMHDy8mb/yL+MqMIWnVBCNuaEZUnorY410S86+RDh2d8e4qMuwNSNx0TJTZ6MR9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bairaktaris.de;
	spf=pass smtp.mailfrom=bairaktaris.de;
	dkim=pass header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Juhy6Mmh;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD96606A8BC
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 18:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FD96606A8BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.a=rsa-sha256 header.s=google header.b=Juhy6Mmh
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c50aaad19fbso127333466b.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 10:27:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1794680827; x=1795285627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GT4NkxFHB1TI5wpt6+gzMiWqzYLveilDkJzsMTF0f6M=;
        b=Juhy6MmhgGon6OdfQwDwIAgPdVBOOliOn6+qnipkggEzUiof3BOERnBnwGu1jNL6hL
         IwpCGJU8i4Qqh74dJYXd/o+H8r2SlQXjeljJCCYMTL/BlCgMWLttcewgWSq73qXwvX7+
         itCJ2vVZOYvXcpI7ooueXx7+bZ2K9740RWJdIlAE4rzSl/GTogJcLEC3HG/RPUkNtiNw
         BSgKwf/k74CaxWM33GCr00PJEnPQ1H7Ao5vqJhu2Ze7dandmFDIu23jsmN8aVr18hXd4
         gQaG1mzXCpshcss+3GQI3MOw7HSM5Bnu1+TUcktw8kPsCKKuFKQViM+iBHxzzs77E6bH
         62mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794680827; x=1795285627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GT4NkxFHB1TI5wpt6+gzMiWqzYLveilDkJzsMTF0f6M=;
        b=ZEbVTjV2TCCx57waRJYK0FpqbvfpaLgtQQqCX89KQ4zGkzo+a0lWif3xwWjp/d+m3R
         yL/ppSwCBFhUo7PTyHVGQ5LenW3+HU4NluFU1DEA3bTXKTm8nZYQDqRdE5fOrgANDqWK
         Zd1sxPa/2RF/efbGiVZhz5X4exNrWCQ1Gem66y82gZQSzgHzjifzWpNnGXCO7zg6MmYI
         uD2bTnkG35THAdEIlL7lny0sanHRYBiD4c5pkIUX2P1gMc5KHxEzH3zOGFzzGpmfZzcl
         tBl6w5sIHkg7H2XKAp6yGvYVjus+XoY8RZVW+kyYYWF1ce2xBEyAP1ohd2ahtZPNtcNb
         4Mcw==
X-Forwarded-Encrypted: i=1; AL+hErGvBVnOoZrGpdiCLkqL5zJsya/0V4BpG8DMt4hxYjMBt+qPnn+U+3gF1cMESbJjr1ZtnLBonPy8qKF+VSM=@vger.kernel.org
X-Gm-Message-State: APuU4Z90ZKQd1NnkatydTQvwV7MQhin0PH7M50RexG7aSHj1aykcON2B
	CNqsTYxA4BmfgzyZDgQ0rUwoSikJCTfR+RDzPvGaZqbTEMhhVRqvci/BdLEib/1WJA==
X-Gm-Gg: AYBFou2nSbG7JI9gOKLpLytLqJpXYCyADqZZkLt1G/wOkCsjyNxb4noktqyrp7runwi
	DQ2k6DrobkDsTqM4hutPxpiVjCZZqOlTNH5gtJpQ4Nc7U4ZPU4R8JGMdle+XnCOs20rNZlZ+PzF
	THxYaceYLr2Ydis0jgF81UTb95z0T3p4m1u0lgSCN1rWDBSoJ4Hl3fpBzgEcaaxrWN/PjRvrwzq
	XXJ6ztYWQPFeFNjz74BX4wNXIEB9txNEoPqI3E0T/TC4qIA55zDKtDOvoHk4HDRPU1UoX988TwJ
	m3oVRu7R6n2ZgDyTc2+ZfmiLGJWkMPyICzM+o66odlCDjWrIcFrYwFkbKY1TSMDt+7gQ7NE+AoA
	kCEJdESt1TNRTn3skwuWOcdrinBAg3cw9qbt4ybglMEvjI/h3UT8v5nk1vvVhOTdeb+pXlYsMAb
	ZzX1rmGBEr2PCQV0IkiGVsQEnaIT67boGeA3AcnUyF8r3lx8tst7y8cqpv/35r6DfPZOsXMdV2B
	ftn42QDSymnHO+Tbw4eCe9CLdPnGv3TMNuZzCvCGRbsTw/KviEQJsDGvJk8Pphi8WObRMV8fbak
	NiLUE7XtsXqwnnAjAZzYHARb3AEukywvbXuuYmdaJMTk905ka/cIyBWkvVxMJ18l3XYAqh69sJS
	Tdxf9ZpZpCQxvZXIfllEF2AvS3n1HlxNfwVXu0builL5n2+IPOIr10ujAj47Cv0GA/ji3SsZvPW
	6DkgxkN8ussP178KnbY2cJGgrYRS/jh3mKleN/esN7gmcUk4z8RIXWJZeB4BDcww7bqpvQphlKn
	QdwLb9rjgr8TRl8KjM96A/RaPZ5gKNiVwkMB3I2HK/G47NvWTtp4SiA7q5V9noZuRmcVDnm5631
	9TQ=
X-Received: by 2002:a17:907:608f:b0:c4d:456c:4a29 with SMTP id a640c23a62f3a-c50963dca44mr489044066b.14.1794680827253;
        Sat, 14 Nov 2026 10:27:07 -0800 (PST)
Received: from Desktop.fritz.box ([185.181.130.189])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5a78csm240086066b.4.2026.11.14.10.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 10:27:06 -0800 (PST)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	willemb@google.com,
	steffen.klassert@secunet.com,
	jiayuan.chen@linux.dev,
	mfleming@cloudflare.com,
	almasrymina@google.com,
	bigeasy@linutronix.de,
	richardbgobert@gmail.com,
	ecree.xilinx@gmail.com,
	bsdhenrymartin@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v5 3/4] ipmr: set up GSO state for tunnel vifs
Date: Sat, 14 Nov 2026 19:26:59 +0100
Message-ID: <cbd032be365b09f1108faed42ca165531d5dd99d.1794151759.git.julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794151759.git.julius@bairaktaris.de>
References: <cover.1794151759.git.julius@bairaktaris.de>
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
headers for its own tunnel; drop it before the vif counts it, as
segmentation dropped it before.

Fixes: 9fd1ff5d2ac7 ("udp: Support UDP fraglist GRO/GSO.")
Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/ipv4/ipmr.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index 836f3f95b20c4..09d6b0ff1ffb7 100644
--- a/net/ipv4/ipmr.c
+++ b/net/ipv4/ipmr.c
@@ -1869,6 +1869,10 @@ static void ip_encap(struct net *net, struct sk_buff *skb,
 	struct iphdr *iph;
 	const struct iphdr *old_iph = ip_hdr(skb);
 
+	/* skb_cow() in ipmr_prepare_xmit() leaves no header to unclone */
+	iptunnel_handle_offloads(skb, SKB_GSO_IPXIP4);
+	skb_set_inner_ipproto(skb, IPPROTO_IPIP);
+
 	skb_push(skb, sizeof(struct iphdr));
 	skb->transport_header = skb->network_header;
 	skb_reset_network_header(skb);
@@ -1882,8 +1886,8 @@ static void ip_encap(struct net *net, struct sk_buff *skb,
 	iph->saddr	=	saddr;
 	iph->protocol	=	IPPROTO_IPIP;
 	iph->ihl	=	5;
-	iph->tot_len	=	htons(skb->len);
-	ip_select_ident(net, skb, NULL);
+	iph_set_totlen(iph, skb->len);
+	ip_select_ident_segs(net, skb, NULL, skb_shinfo(skb)->gso_segs ?: 1);
 	ip_send_check(iph);
 
 	memset(&(IPCB(skb)->opt), 0, sizeof(IPCB(skb)->opt));
@@ -1951,6 +1955,9 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
 	}
 
 	if (vif->flags & VIFF_TUNNEL) {
+		/* The inner headers can describe one tunnel only */
+		if (skb_is_gso(skb) && skb->encapsulation)
+			return -1;
 		rt = ip_route_output_ports(net, &fl4, NULL,
 					   vif->remote, vif->local,
 					   0, 0,
-- 
2.53.0

