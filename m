Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069471;
	b=kAsGOfbhB+aqISoN2mO0TtVWSf+KNiXu4Uu8gFo5oXjFLB0CQ4s7Xx/VHMvhhjP+93/t
	 Dv+RbvaXdP+tz8YS/1FlZfQVtB1yFeNAUybZLm8/9FciK8+dQE1LWtat++sXKLW9Pp3/Y
	 zQoxjmuBziFxukrhPv2VpY/NMoaq1XT/IkvbwXtWseUnRwNMopcjQdBOS4YntQleHugBd
	 pZIeggaKYa67ObOwoNZ9UaUJwDrklygYK6wo4BSYPnV+NfVLbIYMnS/AN041QFEl934nb
	 /isNEHfUL+sdO75n9Hyl7c+yBvUjbKcebPArJdbeO+oDwU9wAd/cyMxtwpUcXp0IJKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 To:Cc:Message-ID:In-Reply-To:References:From:Date:Subject;
	bh=LYzIw2h63C7TJ7EZ3aau0el7NfxeZ14SAIQjRaCB+n0=;
	b=qv8h+Kam5KJoW/pEoVuSzjMNOj7yNC3m2QfAwge4GvJ14L/4rMyJ9VBE8s/NXCckxs5d
	 Xlkd2ntJV5FtIDdwJEh6W/nbeEE0WQxG7FD2uPXRlbR3h9rhEmOgI4/CZkoyfhF7E5X7M
	 7GCa4YXWEYmVV2fPMeWsBE2QXGork89c8RZhNd5VBzFNrE0Wbz34q2kk3K1rjGnHNr0GF
	 7fKCzSCuJHW+t4E0td5huYiU10hcTrkKKWtx1geM0LfRQuT3LwO1h4wVCX+hDcERZxykX
	 Cry8Z+7EdjAIL0SVQNDd3CtDYPwrbIM3YElZVZdRQLr52pi09UC+aZ9zX1Xg8KFJOYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dHVMlYiV;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BA9606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:51:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5BA9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dHVMlYiV
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ad6499e88fso541739a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793069470; x=1793674270; darn=vger.kernel.org;
        h=subject:date:from:references:in-reply-to:message-id:cc:to:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LYzIw2h63C7TJ7EZ3aau0el7NfxeZ14SAIQjRaCB+n0=;
        b=dHVMlYiV0HTDZdxGWizwLohev8WvIys6fcn8S2ZfUGoHWSXoqj2+T422EoMgrvxE9w
         BHk6wUnnyFNHSp8iFbRfcPOv6bRAvfY32ZUFe2Xda56jrOXzKGiHHWG31Pq1NGaKlaxd
         eq+DXle5XLjO2oIa8sDB0Z2GIttTaZdtBn8yNOvKPfHxa5myGihCass2DPWZjCd56wmt
         AsuzsDkU2PlRUccTETcU3MJ4L+wQE5ZWNNcTSyuOf8cCYHMgquf57ss8ZW0OP3MSIP3G
         H8MNAwsdb36OH+0+Pqm3wyrhngmz+AkNMYmor6LfT0l5tzIROV5qWJZCjeY3Xzoj3eDH
         /CRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069470; x=1793674270;
        h=subject:date:from:references:in-reply-to:message-id:cc:to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYzIw2h63C7TJ7EZ3aau0el7NfxeZ14SAIQjRaCB+n0=;
        b=izJljFuSyhbjPaZYFk4N4bSKYxVphSHQY1/PyJK1k/Jmxsa/2FdAojGx/sdCOZrzmH
         TS9a7CAS4skm+5DvHS7kYwBXuepTgV0nDsZFJCeVisqJ6tm8ZKxTSLUxUtk7tw87hcWU
         omwgiDGkf0eDLzdQQRbUDQPL3T8rUOYy2/AKs9VD2xaNnAwF69WFLywdRZDGpq2xD5RZ
         ISknW/EvCzeRxhVw+6RE7RJZjEEeMXpZZ10qfhZ+NVluNEAEPdVc41+dFsR6UP6BunCO
         ajzoMHSCaPJZDLkifvg2at7NSK3BLIwjFFPeVzKJZgoU388HeO8KXSf9fLWWs7jGzWpP
         14Gw==
X-Forwarded-Encrypted: i=1; AKwUvBxfouzw+O9q4kBeIVJKuTB/Ep9qNqMdMqX9UBmbXBElSuZ2Bb94nhuZT1XjTY3PmRr151bfhGpDktmnx0Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDfmxCZJCrbHaesjXaEf9bjPrI+f6esqx9sOdDX5e+7YMdtVPG
	AzghVbb4FTZK6Jq2JB4AhUdlkvga/Kh/pFQ5xgaVfN24+ZUWUp4w+7Oa
X-Gm-Gg: AYBFou0qL4wvf8oZGi4MGZafl6R8j26Td4h+CpZq7GyQZZpo5RLc8t1Ye6lNbMA4qv9
	zPgYn6LbpjMtHAAdVeb+5lwsMIwvabLosOhLHsvagMUM42G6N83wxAcRdh3BeZDwoTTv3sYrLZ/
	iMrjbvwQbUqK4JnLnTRB/En8eoSYZhrkFMpy2V88jGPTK+0GkISg9KykZTMZAUjAMHCNDvuLBVf
	T5rugEzfFnqDcI1M1PY/8f/pqX+Gz7rUGklpPYnlBIyDRilWpmZYVSmLwd7rq4EpuATcLPuWLz8
	0qQwfWOZDhCfgkLSV2WkWI4hdEm5auXRYWJNrQcypAqH7HYRf7eUhxuzd90J1w0PIWfNf/DkG97
	jE0D7C62xqb05lX4wzeQcUwA0U0qyvaZUtqNlpNzgedPKDW1Qke+HKP7/dhT7OU2BxXlCSP7dem
	eILDIlFVH+/k6/K1zqQhZ+a5/PI4uk/OXGcS/Grw5HMIO9Xp+1EMlDUXIOjGfgD22x2SK9BuR19
	bySaNuyT10G6c9ya9trzcZ0pJq6g85cR+DcbSJBczyP7pCA1ZiAazJdQo4EUyCmYeruUo5XWiJm
	Vrr3W5TxEnJowX1D6BUfQ21ZIo6wKZKLEFeiNZA3zdocsI6BtS6rpHctiSpot9N1qEkrLMI=
X-Received: by 2002:a17:90b:2ecc:b0:3ac:e6a:1af5 with SMTP id 98e67ed59e1d1-3adea1f17fdmr12335096a91.2.1793069469769;
        Mon, 26 Oct 2026 19:51:09 -0700 (PDT)
Received: from msg ([188.253.120.77])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adeb82761esm6930676a91.0.2026.10.26.19.51.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 19:51:09 -0700 (PDT)
To: netdev@vger.kernel.org
Cc: steffen.klassert@secunet.com,
	chopps@labn.net,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	dsahern@kernel.org,
	idosch@nvidia.com,
	linux-kernel@vger.kernel.org
Message-ID: <20261027105031.19928-3-q.h.hack.winter@gmail.com>
In-Reply-To: <20261027105031.19928-1-q.h.hack.winter@gmail.com>
References: <20261027105031.19928-1-q.h.hack.winter@gmail.com>
From: Qihang <q.h.hack.winter@gmail.com>
Date: Wed, 14 Oct 2026 21:17:12 +0800
Subject: [PATCH net v7 2/3] xfrm: set the address family before the early
 invalid-state drop
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The early drop in xfrm_input() for a state that is no longer valid runs
while family is still AF_UNSPEC, so xfrm_rcv_cb() cannot find the
afinfo and the receive callback is never invoked for such a packet.
Set the family from the state before the check so that the drop path
dispatches the callback like every other drop does.

This is also a prerequisite for releasing the tunnel device reference
on that drop path in the next patch: without a family, the release
cannot tell an ip_tunnel from an ip6_tnl.

Fixes: 4ce3dbe397d7 ("xfrm: Fix xfrm_input() to verify state is valid when (encap_type < 0)")
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
 net/xfrm/xfrm_input.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
index cfd5cea033127..ab391258a5028 100644
--- a/net/xfrm/xfrm_input.c
+++ b/net/xfrm/xfrm_input.c
@@ -487,6 +487,7 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 				      encap_type == UDP_ENCAP_ESPINUDP))) {
 		x = xfrm_input_state(skb);
 		xfrm_proto = x->type ? x->type->proto : nexthdr;
+		family = x->props.family;
 
 		if (unlikely(x->km.state != XFRM_STATE_VALID)) {
 			if (x->km.state == XFRM_STATE_ACQ)
@@ -500,8 +501,6 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 			goto drop;
 		}
 
-		family = x->props.family;
-
 		/* An encap_type of -2 indicates reconstructed inner packet */
 		if (encap_type == -2)
 			goto resume_decapped;
-- 
2.54.0 (Apple Git-157)


