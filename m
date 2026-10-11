Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B29A347FEC
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791736212; cv=none; b=GCdVmPvVCwxZ/S5n78TDnZeB+Gq7HTOdQt/52rOE6PFgflR/FuZ34rZZUU05y5mP7qyPvK//Iwy4fR5cUpfjKbZq9KykNdHq9s7wluKQ7GLZdjBH25qfT9cxqzLhAyzWE3SqfuX+S+hseQzIdrcwIALPqie8n+3tyxsmwcIhe5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791736212; c=relaxed/simple;
	bh=hEc0kCOZfiUiEVRrrIDOsGo2o7eOAQwwDExOmAG8wnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U8la7L22BHM/Mma1aUzzaRBUb6pMoE9GwPhEGYSuiA5rVnLJKXLB3PkQfKKadGK6xJ+HvPqiNCOSlat0Ej+loZgTPjyvABqqnU6iUTQCs4EbbaSGB2/XyE+PGTmfwEEYkMIfUG8gwN2UkAqDkl9yEqpFwCrb3V4Cyv21NDRWXgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=eUeSyPbn; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="eUeSyPbn"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so9841935e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1791736207; x=1792341007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAgIBxS7QL67cIVzFUUyXiPNC+DuOESUIt9z3Xwqot0=;
        b=eUeSyPbnBJwlGnSLeavrL4g47XL5W/IEkVFn8oxwmic4B0Y932exHyUo2bGKZ/XAd3
         lmNFbDM+00R7VuhjIKRb5xhhryhvdFzvOlwYLqPF50cDTcSVj3sZVMpoCXG1VraftAgB
         0n3OuS0Lft4NLR4GQ1nIecXHt86TveEVsqvP3wviHY1c/yHvOVVY8A3aNpbjTvktDV39
         AI8vqRM71ySqeLFP6oylqlXWicyGjp1PnWEeyFQjzspSRSstqyaO54gc7RMOx7D518ab
         LJJ0cQsiUFbBFAiaXFmxU4HHjaXz+mW4W3/mAk9dQLNolfMgzTsbe9zfDfPpY/trtaBW
         aVYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791736207; x=1792341007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IAgIBxS7QL67cIVzFUUyXiPNC+DuOESUIt9z3Xwqot0=;
        b=YeRBgO141Ke4cd5Nk8NT1Dou8HPozWlK1rNcFldrs8rW5PR7PypZRnilJj7mdPFQO5
         zhXZqRyPLd6u4zcoEeWStH/FEKWp8IDlLH+jDQtp/R1nxZZB5OgF9i77pyKpFCow+kRD
         FzQpb9L04nyup1wzrtUBb0Tb4yeudI5Uhev5psPbyrdh7N+/sE2bHmOye5o9fBiaIRnV
         9Asn5cYkI2iT2mTsqlKrKtIpGUUpHnYxlzwCcwBodKqW8CLU5IlzTCVE3qbMQ2kz5C9I
         wwupM6c+M1RfJSvfzuxjnJcAIo8NfubQj/s8z9Ss4sK5pwLBfUiZGPt0jh0KVwfyI+gu
         eC/g==
X-Forwarded-Encrypted: i=1; AKwUvBwPjF4+gLxZf6SUvuRdfJa7e/h5z956/aCEa7lmZQcni2F3cZMdr8wl6JDVi+b3FK2YGL/Q6BdLzALIWj8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMfEaRqCXQTUzqc0iTEdNMwm5CTJrj1rzkMwpQJUPBvAXan3Lc
	cNl4lkAM0AGe7rCcGnhnrxbZX/Xpy62nm6KYJM0E3VCctr9E8FWdu2wN4XmIfPc1aw==
X-Gm-Gg: AYBFou2i/miEMxYgaIzaUW4fgQ8nkR06zbkPcN43D+oOxy9UR4lix2yvKy7Ymohz2aw
	V3IIjZuUcjofGH4l72kggybcGPUJMRNkoBC0qTDvWeqQXS0zrThnjka0HBrZZV+2y3u4PFrlZVm
	nTEU42TLp1+dgyk6V8X1Y1mAODLWQ3WP+a2TafbpIjzZ4fLXcftU7WD57n9cxexk345YIhroMLg
	U/I0RhYyyhnE89b/ong8W7Nql1SA+k4cw9TgsR6uMwh47LXmt1VRLT6PsXBcULE8p5vvkTgtO3j
	VUD5/6kEE1zmKlwaVTxn9Lf7QtNgFFhvge0zkvjH7LKnvZCqx7nqSGxMZK4xpI2M9nf3NYRopw5
	NlD/Xupf5C826GL9P/AcmTR51ptEfFeh4E9tJ4eIA+aWRxoV7DNNfhICs5slW3knicVgng/IxR2
	HjiO5TcP47gAAEL9PNVqqzq0RZB2JkDrXnaVrC/saPJEO/CA2DZU9LgqSrHNBxQnsfUuxJhGN2i
	r5Zw80NAdxuxlTjW4+GRB1wKOKyR6JEze1IasUEO6uhUj7na0haflE/prDo+epTYjqTGFI5en3i
	5ryf2QguvDtFQ3cr1wUvS2uyJmIdfpI0xZgiwfawKCzv+disIupfPrFRNwg3qY22+u5PzaRiz9x
	retB9fPPHdd0cn5TwA8HhmoEn7TVUOf56j20vfa4D7lJoYEcTIIKz1Qa/rbEn2wdhTA7y2mlHxX
	GCo5A6QROa9qaiSP0nR21YCdNOjukZ3pNC8FEA+x7ogdrFoIY9
X-Received: by 2002:a05:600c:4747:b0:4a1:88de:9e8b with SMTP id 5b1f17b1804b1-4a18e49d65dmr136454365e9.5.1791736205975;
        Sun, 11 Oct 2026 09:30:05 -0700 (PDT)
Received: from Desktop.vpn.uni-hamburg.de (dhcp-40-52.vpn.uni-hamburg.de. [134.100.40.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acc936sm14657920f8f.44.2026.10.11.09.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 09:30:05 -0700 (PDT)
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
Subject: [PATCH net v2 3/3] ipmr: do not drop GSO packets that fit the MTU after segmentation
Date: Sun, 11 Oct 2026 18:29:57 +0200
Message-ID: <20261011162957.1328474-4-julius@bairaktaris.de>
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

ipmr_prepare_xmit() drops a packet with DF set when skb->len exceeds the
route MTU, without checking whether it is a GSO packet. A UDP multicast
stream received with fraglist GRO or UDP GRO forwarding enabled is
aggregated into GSO packets, and every aggregate is dropped with
FragFails, while ip_forward() lets the same packets pass by checking
skb_gso_validate_network_len(). Do the same for multicast routing,
leaving room for the outer header on tunnel vifs. ip6mr has no such
check and leaves GSO packets to ip6_output().

On an IPQ8074 router with fraglist GRO on, a 10 Mbit/s stream of
1316-byte DF datagrams routed by igmpproxy loses 14.5 to 15.5% (n=3)
and 0% with this change.

Fixes: 9fd1ff5d2ac7 ("udp: Support UDP fraglist GRO/GSO.")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
---
 net/ipv4/ipmr.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
index f0666749b14a7..983565c0711fa 100644
--- a/net/ipv4/ipmr.c
+++ b/net/ipv4/ipmr.c
@@ -1914,6 +1914,7 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
 	struct rtable *rt;
 	struct flowi4 fl4;
 	int    encap = 0;
+	unsigned int mtu;
 
 	vif_dev = vif_dev_read(vif);
 	if (!vif_dev)
@@ -1946,7 +1947,10 @@ static int ipmr_prepare_xmit(struct net *net, struct mr_table *mrt,
 			return -1;
 	}
 
-	if (skb->len+encap > dst4_mtu(&rt->dst) && (ntohs(iph->frag_off) & IP_DF)) {
+	mtu = dst4_mtu(&rt->dst);
+	if (skb->len + encap > mtu && (ntohs(iph->frag_off) & IP_DF) &&
+	    !(skb_is_gso(skb) && mtu > encap &&
+	      skb_gso_validate_network_len(skb, mtu - encap))) {
 		/* Do not fragment multicasts. Alas, IPv4 does not
 		 * allow to send ICMP, so that packets will disappear
 		 * to blackhole.
-- 
2.53.0

