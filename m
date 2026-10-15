Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF65B3A961B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 14:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075179; cv=none; b=gKWtgKe8tUDPKz0UOIMsWO9lunJc+kAFvCGc/zD7PvHTGXe598RFsn4PKJwU+J8/kfBkKwswJMLgKwj+lQzpqZbxrLy2WHm58HPqlH+uFJ3tj1S+ewxlHro7TH2V77tPGsdZb3XA1QZoIwacPaSbsIijtBv33fSc1LQhSXznsfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075179; c=relaxed/simple;
	bh=eRSqI15l3j5EhZBq3lARZcN78mzCenYHCSlvnMFt0VI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ls4FW9k7UPuZnnT2IKrEv8CX0hrf3CVVNHS31r0NScYHWF/qOQO8nnLth/sS/V/rP902IAF3+8tCeAY2V0cT/2xVak2W6agYKTGmcrT+45Lu8kRCKBIfcWHgGVmxYadoqPpdLl6j9OTVBUOJxaeKWDDHFtQmc2ERjF5aTtx3iWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XcN7B6pX; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XcN7B6pX"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3ab752f6244so1317715a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792075177; x=1792679977; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=beLzBZIUZpM7ObPiV9MC0Cpwnobx3bUdDDmAgDdY05I=;
        b=XcN7B6pXM0znzaG5ISRfsWtkRvZ5tMQ0mvRsi/bfDZbyZt0Oz7FpKzd+8YCbzxYpqT
         LcVoYfdNDQBJg/Qgf1xD5a4YjZsyOa4FL9GRH4nOyCtNbRBIJ6PlTGRiQ2h+92Qk5hV1
         UHZUmKfCb6985KKyMa/92rMhzE0kD+SVy6hXu3as4zHRJh7PuJJdli/QHXmaNBDCgr+y
         47LtliuC6oUHG1DYOAMRykWcujuQWIhoOgdGKaXAipHVs6oAZTHq63BvDPv5//1BxGyq
         +2XIY/xOsvnAMVmu0bZuD6bPtjxbL44Q/hg+TFVEh2q2m4xFtdZH/JkImiHHGVPybRfL
         oOjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075177; x=1792679977;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=beLzBZIUZpM7ObPiV9MC0Cpwnobx3bUdDDmAgDdY05I=;
        b=qVlm+g4Hh3oufaQyYGIMopyPFjYIzneOYVhqonNSEweE0DHJQLvMKOBmqF9U3VME5L
         JPjLgTox8EWCXdtCENsc1o5/iVDtkih6T/WLNCqweXDHH/BIeg+4BYYP9+OvZEtMQMOY
         c8WC+I7rLJSDrAbUbNmL+w84qfJiPLg+R3oWVNkUUzRIYVmFV7ctaWR717BGGeWn2kUl
         CoEJr/OYnAvmC/sht2aK/EdWXdABO2OErlAgde9YbDMgFcjgR6DBiejUvFLFrMSRDpc+
         K2441XxMtx3xCZpKRJ5MOLuGE3bw9v8no4OpW7CC+OJPGq7G6N+Z2ecDppVcVACRfLR8
         q3nQ==
X-Forwarded-Encrypted: i=1; AKwUvBzqb7bZEocmEHCuMIWkB5MhzTd9BE5X1XGv/t4E2ToO/T1HlZgpNyFdBBQtULeotllb4v/gA/z8Nk8VAWM=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSjl/WfnlxTW+Vvsp0rmLhGJ+4+zA7bWQheALfYH5bBp0V1nBD
	7yOCxDmZMZt5U5HTuzhoUOnB5beCnwiULooz4qdri4Epse9VrsxaADTg
X-Gm-Gg: AYBFou1lngNoyKCJ7hte8cAC2QvV0C3noTZJT6UxLBQtFYloHnSn1KPATp1AcQeuWkA
	MZNy++pzVRAD5JM7b1T7I72Hw9BL1GMHxMZ0hzSOklFY9DAYmT53Za9dnTlXwQ0UGJii4UAX0pp
	ZrVeyDNJlq++f1b7B7xNKq22yzqunlJjRNH9+U1aPZictrw+zD9ONEjv77AhHiPaAksag4v/oLB
	bn56H2o+uvVf5sQaeo1pmEaEAnkusVhuIgPWLm+RyalZ+Z3lp8kFe+F5bbnGq9Vqlv0xKp/YgFx
	NSMcB4mCMQBjkFAwobbHUSnOKyxtQbyUMosKGNzSfDce+wWDG+fpmbl/Nf/OaVLhMUS0UHWZWiU
	GROciwhdOhvqARZ6SPzEVlfrxvcEKwWkRyYMxx/Lf/FbxyGiVUGlV6M+jZ0N8B279PsNQDbbzSh
	ftCmi4iii5mzCkxqhwb6yiJL16cDy7g1jeBfP7Poyere5LgG9XAMRIj1lL89sWVdZwxx98DFN2L
	9Zrkm+48Q==
X-Received: by 2002:a17:90b:164c:b0:3ac:8897:7b9d with SMTP id 98e67ed59e1d1-3ac88978372mr4119325a91.1.1792075177278;
        Thu, 15 Oct 2026 07:39:37 -0700 (PDT)
Received: from dev.local ([163.43.243.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9377fe6esm2583465a91.3.2026.10.15.07.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:39:36 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Thu, 15 Oct 2026 23:39:28 +0900
Subject: [PATCH net-next v3 2/2] seg6: skip the route refcount in seg6local
 IPv4 lookups
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-seg6-lookup-noref-v3-2-6d51a60a67d3@gmail.com>
References: <20261015-seg6-lookup-noref-v3-0-6d51a60a67d3@gmail.com>
In-Reply-To: <20261015-seg6-lookup-noref-v3-0-6d51a60a67d3@gmail.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabriel Goller <g.goller@proxmox.com>, 
 Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2354;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=eRSqI15l3j5EhZBq3lARZcN78mzCenYHCSlvnMFt0VI=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBq0OWgV62Y71e6frflzkP6jeb/zQmRMj/piFjtl
 j1M6UTYKS6JAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCatDloAAKCRAq19F1Kl0b
 Tb8AD/41ovbQl0BD6p6B5m5OaBmrqSMug/dkuXjnalKpT9oVpg78b2t9rhYCKnbwV2dD0Qhn3So
 rGkndlgJFKVk4ujcyauzb57F7m8z9DXQYCRjhQHFqm28f3z0WlX1vftI45tM+0BjpMQLV1qLZZr
 F9l0jbfceHPOnfzaisqYOQR7RNJ/CSUOYF5/WuKH2fV4hVgfLj7tm8JsBKya68NVoME19u7Q6Qj
 VqkqqZw8h29hdMTSWgZZuSLV3LhYksBfuP9wpCmyJ7mglDPz0l/DY26dWf/OAZ06bIjPNF0hf0l
 ZiqkDW17Akf5A3//YRr6O1Ym82FnUtOan052hI4QuUvd/bmCp87RwSh0lYSBLazyNRS8YEGJ8Qn
 qXH8mrrOkpUTqDVnWYPrvTG2QLsDX2AOeqebDfRVq09QNtaFFIHbmovUNmCKomcrK+nq7Wmukvr
 ywocbxIEtpKc1lOay8qpsspTNP8Fqiu3Pksl5I2e8Zwz0r+xqf4H3rgps9pi1VU88KZw9sgfxAh
 dy3PnUJMfp1PghxuZUR9Kg9fYsEfqFyBTw9KCcQ0n25F4/iBnTpxQCYraQ/Q1ng7l+s+npUBVfV
 s9EZm69wu/Iw8clSdDDgjnYqyXG4bxyUKcG0Y1QBssQDVAOb6uYUhOKxo0gEDeD8pZuXlNDAdFo
 Ox9ew7pfQOStwQg==
X-Developer-Key: i=yuya.kusakabe@gmail.com; a=openpgp;
 fpr=DA07BBAC01FC4D28C7AA6BA62AD7D1752A5D1B4D

ip_route_input() looks the input route up with ip_route_input_noref()
and then forces a reference on it, which is dropped again when the
packet is transmitted.  End.DX4 and End.DT4 call it and hand the skb
to dst_input() within one RCU read-side section: the one of the
receive path, or that of the nfnetlink verdict handler for a packet
reinjected from NFQUEUE.

Use ip_route_input_noref(), as ip_rcv_finish() does.

Throughput at 0.5% packet loss of 82-byte IPv4-in-IPv6 UDP packets
(no SRH), spread by RSS on an ixgbe 82599ES across two 10-core Xeon
E5-2650 v3, offered by TRex over 10 runs of 10 s, in Mpps:

  End.DX4
  queues  cores                   before   after
  1       1                        0.791   0.811  (+2.5%)
  10      10 on the NIC's socket   6.118   7.394  (+20.9%)
  16      10 + 6 on two sockets    3.305  10.205  (+208.8%)

  End.DT4
  queues  cores                   before   after
  1       1                        0.481   0.489  (+1.6%)
  10      10 on the NIC's socket   4.328   4.588  (+6.0%)
  16      10 + 6 on two sockets    3.351   7.153  (+113.5%)

Every CPU takes and drops a reference on the same input route, the
one cached on the nexthop.  At 16 queues that cache line bounces
between the sockets, and skb_dst_force() and dst_release() together
take more than half of the cycles for End.DX4 and over 40% for End.DT4.

Assisted-by: LLM
Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
 net/ipv6/seg6_local.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index 965263ff65d3..66b22c61b835 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -1095,7 +1095,7 @@ static int input_action_end_dx4_finish(struct net *net, struct sock *sk,
 
 	skb_dst_drop(skb);
 
-	reason = ip_route_input(skb, nhaddr, iph->saddr, 0, skb->dev);
+	reason = ip_route_input_noref(skb, nhaddr, iph->saddr, 0, skb->dev);
 	if (reason) {
 		kfree_skb_reason(skb, reason);
 		return -EINVAL;
@@ -1321,7 +1321,7 @@ static int input_action_end_dt4(struct sk_buff *skb,
 
 	iph = ip_hdr(skb);
 
-	reason = ip_route_input(skb, iph->daddr, iph->saddr, 0, skb->dev);
+	reason = ip_route_input_noref(skb, iph->daddr, iph->saddr, 0, skb->dev);
 	if (unlikely(reason))
 		goto drop;
 

-- 
2.50.1

