Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763288;
	b=vQ/PVmY0/qW9SW9MwsKWNkZgsBbNBRcRK2waVwc6yC/1OBhM0u4S+qEm4hvqR9d+wq6E
	 xnU0pBnQYUJf9RNklVnTwzjtai/Gfd6gR/4vyt5N2YNC0mz6LOGSXGQARqDD5cJ3WQAqn
	 uA2bsZdp1uHb1bmDeWS+83C1EGXTBH8PfKPJZAOrUttQGVtJLXzEHpeUMqnBz0mre7cRW
	 z09hyEfdkyCeilDArf325D8DIa+zUcjuvMQeKardCcayjZ8wvv9YWOGPJ8ZktrdeY0Eot
	 RPjZdQ+GMSJHbpVyYyzAgnnV36NjG+Om5qH9fIyhKWpc04AK1T4TY6BCPIyRLVUmHyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aTuh+D7Cip1uCxKjxcVHv7QGaADbK8cS88J8p1XYOCs=;
	b=vcO198K0KD/mY0/LPYORsu9jsdbAwKvgMFMtohBsroG0PD3SVMbr0uxcVAHRNwm4JR6M
	 zqPH+1RJa15OYDcCWFbvtoCujZXn645endNuggVuVjteHPL/3gSn3qbe+odjr8EExkC4i
	 o+GxrzeR3bCq8K9TO0g4o2ysMtSeuesFSjIUs8xb91Lrf9GZZve21jvAyVyMS8nd2MV51
	 /OduGcWK+xb9S/tgo3dwxVxVuhswjhRZXgDHfwK3JvzaUxxAZ/57tqVfssX1fnYJ8J7xH
	 0x3leoMSDQXldsV+xxw6vb5cnec152mx5fHrYXwgvbAjZbzKhAdOaxH7ALO1CcDeLyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="Y1d/PBQp";
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53232606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 13:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53232606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y1d/PBQp
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so332084a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 06:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792763287; x=1793368087; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aTuh+D7Cip1uCxKjxcVHv7QGaADbK8cS88J8p1XYOCs=;
        b=Y1d/PBQpYKY6/A/y71lA65P779UqaI8jgvAt/xfUqzJ47TuTdD/TgWgrzFAERp4DgD
         1rovMaCMal5+BfirxwrV+nyvBf29jE8f4OP8Bm5ybJVOuVfc4mIdxD06ygbJRbd945e2
         mpp/+y02xSsEHvyQPh4WwI02BfxmO/rW9Lgd+EivWxhu6VSztRAt8W71aAQjlGnlPqUD
         oXU7PHPGItaP6U789LSd/Ovm3Zwb+8J5cCA0bYIZAulenW6WWn5uXFtZzdoqg2nG5hvA
         prOq+66GfNJ1wRr/zYdLRrIwCtEHpinh9POKCj215i5TSXOIf+nY2dJFuU5fMPmGQQ3f
         60ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792763287; x=1793368087;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aTuh+D7Cip1uCxKjxcVHv7QGaADbK8cS88J8p1XYOCs=;
        b=Qo9kA2+o6nFXeo608rXP1011471iga26lh98QMn1Uq+qA3vGQ5i+CLDumiGSk6jf9u
         v06YZ3mH7OGzH6lXpy6jUX8A8wHtFxwQzArkkYVN9rOvGOEHovm7sWHYre9KtsdEy7rw
         ldA85mDkQsZZck9jqq5IXDQpv0s8o/LSRFdD8ClhPEEXvbUeM0qfh7v2fuOnh40Np52P
         jkLSf0gAbBMPV3dWrJ1I6NcsuUIL9ZN+SoPEfSvF1v3TfJEALLHkaawzvTWG3g9DPeOo
         HAaP1g4BrVz8Hn24hWCB88jDUwKhCdbBFGGLlGDpCgdgcnQtx97HkQT9/DQlztnT5opi
         qOnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwacyOkSzMFzbkldtGuDRLzmP8trkxJc/Ph+wE/jYJgEbo/LMSI4oSUc+CC2QcX+M2ATtqtmUvmzbh59e4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6+gxNaKJFtnypnu0iMNdqSEjTFJ5W/Q26Zuf/cz1SJI/kQd6B
	zU6V7JA7xjlUaj9TKcKvHsud2H/7nwYKAzqnR5JgQqI/gGNh+Xcfw1PrgMqAD6hf
X-Gm-Gg: AYBFou0MeB2Qdywke4gnnQLYgpsNDYvD8UsT0D2dNw6mWwYnAZUBhOqDwFE8ZnBq9CV
	NV+G9B0nilKp+PjCpEq3WJIUNpEM5jdLWTJIwg0yKzHjTTrbRGJmhS9XhyxjZeIb7KYP54kxOPc
	XFPRbV9/rA8vaspWewwyrK0SE1MxZY5iPSbp/2Te7aK67Ky9ZegRSfEVesRWhkBYWPZAOfIlUgl
	tDfLWRMXiSkr+G9pMQR3cFlz6fX/FeG7Ke7N0aY5nJL9c9CZdMYWw9JZ1l2yvn4PhGh6xvOWPRa
	pR0LQjsA+BHk9SX9a8DiKS/3ke3fZqhPcN01Dg5DWdFy/c1D61lliOHqK4rT5mP02Py7r4687kO
	9N/+aY1rnN1F44Nh8VgJeHhispMBU/JV6bj+zcRqzpmoblaNIsgK/IvYFJqA7eE/lsue43utW3E
	gDLEYVSk7O772vl+i5moBNuVlrybp9f6h6YKjS1hcJFMNL3Gwjb/L8y7txFv6kLUVRlC3hQubS0
	agoiQED5OMDx7xxUrk9ssOpYwFlR9/3zsiBWRABhVInfKCLRUlH97UY
X-Received: by 2002:a17:902:cf0b:b0:2e9:9524:b004 with SMTP id d9443c01a7336-2ea7d07bdf0mr21009825ad.59.1792763286653;
        Fri, 23 Oct 2026 06:48:06 -0700 (PDT)
Received: from dev.local ([163.43.243.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea946778ccsm521295ad.9.2026.10.23.06.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:48:06 -0700 (PDT)
From: Yuya Kusakabe <yuya.kusakabe@gmail.com>
Date: Fri, 23 Oct 2026 22:47:57 +0900
Subject: [PATCH net-next v4 2/2] seg6: skip the route refcount in seg6local
 IPv4 lookups
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
Message-Id: <20261023-seg6-lookup-noref-v4-2-0ad0a83960ef@gmail.com>
References: <20261023-seg6-lookup-noref-v4-0-0ad0a83960ef@gmail.com>
In-Reply-To: <20261023-seg6-lookup-noref-v4-0-0ad0a83960ef@gmail.com>
To: Andrea Mayer <andrea.mayer@uniroma2.it>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabriel Goller <g.goller@proxmox.com>, 
 Yuya Kusakabe <yuya.kusakabe@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2336;
 i=yuya.kusakabe@gmail.com; h=from:subject:message-id;
 bh=dRDW/7at3wyNN9uALP8BS6Z0fSc8Nk/01osTUNBgfr4=;
 b=owEBbQKS/ZANAwAIASrX0XUqXRtNAcsmYgBq22WNPxnrDPhFO8axQuCzhqgzOhWydCaY329WX
 j1Ei2p6tgKJAjMEAAEIAB0WIQTaB7usAfxNKMeqa6Yq19F1Kl0bTQUCattljQAKCRAq19F1Kl0b
 TR8RD/4lGPTKbC9FNWBsj8NkZsNtj43e1D8FfzYa9V6UIWyJ2fkqVvoes07yH8beA2ofnin1nzd
 kcHJqbXHHV6lr5cQ96Zogc6bNrwzcKSOu/tCGZGjcewJrGfe5ECdOrHLaTiMBBjbNX2aKzz0x4P
 EZmZtyioDL+cZBMI9hnRgLAznqJi2sNcpeyz8JXxYN4r1Wpkzm9+/uZ/REoIziwJ+9msA6pOFad
 7Sse6sbbLtjH5wtczdUMzvRbjlVcXz9RkzGN0LNw14R2EjHo8fPYmMOqEWmfRv08NHaI2BCFwGH
 lBMQoXJJXhOHv3o2HkKqLeIjLceFYv9LZzUXNRW5PHfsF7S38dPPTlDs4fWMsHwPBkPPgMniqZR
 6fP4YRQux1DvJDXurBrQgor43DEZSqx5xCOaw0DEIDayptZTp2GGxgkMxy+9mOSq24ERIPG83AD
 XTRTPKU09yEjhd9OxaXBZ/9v9tvjM8LAqRGCFgC2V/MUaZShrQ6MrkWR6kZaT/9EzXwV2sXiP6I
 CHaYIEV2XnNu35llLD/RDZBURAQXfKofXCcIlPcw8NtU4/0slgEAUPNDrIxu/VsYrR5tLVLKUej
 uFNlgaLe00MBnq7wB8rwl/AoO3oxrTVttMQKxcv/FljU+9wVvaKqHTU+J/KP0A3NwPeMnK2moaw
 Je6LVzpHISBH1kw==
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

Signed-off-by: Yuya Kusakabe <yuya.kusakabe@gmail.com>
---
 net/ipv6/seg6_local.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/ipv6/seg6_local.c b/net/ipv6/seg6_local.c
index 7fbcf590297d..209e31c21e33 100644
--- a/net/ipv6/seg6_local.c
+++ b/net/ipv6/seg6_local.c
@@ -1096,7 +1096,7 @@ static int input_action_end_dx4_finish(struct net *net, struct sock *sk,
 
 	skb_dst_drop(skb);
 
-	reason = ip_route_input(skb, nhaddr, iph->saddr, 0, skb->dev);
+	reason = ip_route_input_noref(skb, nhaddr, iph->saddr, 0, skb->dev);
 	if (reason) {
 		kfree_skb_reason(skb, reason);
 		return -EINVAL;
@@ -1322,7 +1322,7 @@ static int input_action_end_dt4(struct sk_buff *skb,
 
 	iph = ip_hdr(skb);
 
-	reason = ip_route_input(skb, iph->daddr, iph->saddr, 0, skb->dev);
+	reason = ip_route_input_noref(skb, iph->daddr, iph->saddr, 0, skb->dev);
 	if (unlikely(reason))
 		goto drop;
 

-- 
2.50.1

