Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069459;
	b=WrQ84uZJlBZ301kMefHwjwMEaxpW8RNDNkme6oCND5Dt3ux79guKw7IxlA3TGVAlq0HD
	 zss4iBNYlx4Eyzdu5S+tdKZtwHIdVTh3jnL7WK8ZHvFhFCAzK4hV6tttqiye5wGPWayQx
	 XAwOFy9tCK1NCI+sVMn2hUJ2hsreBxh8xGSetLSPfivwFjfCvlcOafi2KWOvIVOthbwaS
	 Jo3tqJ76nuUC0SmTQ4KPQMfj/tNj6kSANjSdEoaZI8G02HF0H0jeU5womD+QBGmoxe2d1
	 09/Snu25MZFmdVEM4OLGatSd5LvJ8n7StvhgoagdHWzd1jYgj8hqn9rgK8aprl7itWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 To:Cc:Message-ID:In-Reply-To:References:From:Date:Subject;
	bh=eK+WYOUFELHHjea/x0NYiMCaugcTpDunS7GxJSBv5co=;
	b=xpPa7imdnsYrcVvQSw1uA4gYHh36sW6mx565399XHrkRfJ/yVWQ7zvjEYP1n9FxLds6W
	 gsYTK/S8YmVAZruYyiG2CWw3wN7+s0vf7CUmnNlqZNnyV0sWgoiyH/htSwfpOnzjGkhqU
	 3sy2Rr5xPDgSnnrBlgfNNNJ1c/rQbtZ/ihTkwROWzXapPI2/ktY4/Zusjz5xp0vV1B+4z
	 zqrjgF8P8UnkkWbKmqq4uXIN1jfScF3xAqT++FZxNUvEPh7KJyu0X5DsHNU0sqYnG01KA
	 J+WQzS3FGSxz2X338hIHVptnKSyOv8ewaL46Dz3uIMmiYH8GQH95Nfsgj7af4Px1XZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VFoYJa03;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E7D606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71E7D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VFoYJa03
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ad47c246f8so340598a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793069459; x=1793674259; darn=vger.kernel.org;
        h=subject:date:from:references:in-reply-to:message-id:cc:to:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=eK+WYOUFELHHjea/x0NYiMCaugcTpDunS7GxJSBv5co=;
        b=VFoYJa03ilUbofE0jNoZ9YmZxV9rormaKeZkCxpOyO1ERKeRWbNuUPgyDTMAwCSqGG
         9xHorPDHGNChsMYh2uinruRGJ0QsHxRSLq9q2dE12TO7sY6Hj9HUOdS4WxfvrjvHE5ZO
         WX60R3P1k3s4WKJliyq/ICieZqt2aQSLEqlG8xrv2eZinjW4jvLKTazuyxvfnAa/0sfz
         RtukRxEWs2rpfvYfFzBCIi8A+toabrx6tvv92Uqhd9WVj5jykUnwn16G+FEZYHayVFPL
         FGfU6ILt70urw0lVhdUS2MGdPqxxPf8nudWLoe7JN/z3pynYMRspo4YNQTX/nhJkPDh0
         UZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069459; x=1793674259;
        h=subject:date:from:references:in-reply-to:message-id:cc:to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eK+WYOUFELHHjea/x0NYiMCaugcTpDunS7GxJSBv5co=;
        b=NWOpGC20YM1oTecFCw/Tlk6fKVppQBFK9gSABfE/exe+oLu9/DJpkYvqIFjDD3EuBq
         sJdwxcxuPSy3Qgf/iynBrAesmJ/rfp8abskmm7mNy4TBtoj4HpeswfjEvT8ly8O/FQCz
         83J6/i5v2JHKPnMZi3n1QdAase0Qj7zIqulCJeDI+QamgJCsrI0r1LjoTHqeZCMckmj0
         FqIzls06HTVEvhYjFoBj1gzwk+toVj+5LcRqxKVphaX92fgIBA0Vp4lhVCneHdaVB/hI
         5GYmO3c4az/Nset50sbpo/LyuFsoMTk4YoMG9N/dscxQ9Mj48epiGmtZ5RnrpyF9mUqW
         2ZSQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/pyOPqsg4cCYMUakApSjWRppaOuXLgIMMfHkiP8IubzYGWDdAbqR2boEmAjuNoLVTjefe7RjMFfFZMj8=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4C9QItO6gKDYnS54ph55XpnnUb5+nhq0oMKlzB1/aqYEtNhzM
	A0E7AWbqQgURhzYpBlPvly/7aKZYxRvqZffWUNJgJpF37bh74a53zCuQ
X-Gm-Gg: AYBFou2ScBTE1hpaAqPrvFa9a4k3dvAwenRzilN4LrnTMbEdY5YCquIE38ytilnwAW3
	VVKd5v8prnQPJ8wITCgVhG8fZmq1zuYm6G3AbzI3wHdgjeoWkB6M9BCGcY3I5b7BhtV4hPCNtE6
	v0cGUpy77yq2Wwx192MaCXyI0k7igV3VX+oRgDfgNj/hPBbyn3LV+SL0pUYE2/6r8IAc4iZme8t
	R3gTRY0MgGY75K/xIol0WuaAQcPrXJZuX6onm0Q268kK6WMzRyAUSJySw6+fXPWoHpi9/pyQc44
	pTLcFBsSnh6qS5EIF1UcKfVuwqEjC5diiYBWsR6k9NogG94MbUQwSDhuEO28gvVncreeNO1mHyf
	Z71JdTSaDgql7Uo2cb1z91Wi7pOMM3jiVzp6TjJ3SL/9AGxj07df48gh7poqR/x6KQ1MBaJVzvk
	QVDMXN70vE2l1Lfxjy7h1v9XNxSthk6y5MWeqRdgSlLAucYOXFXVWqGMRYjsJjMWH7QVxCEYKSq
	2GFfdiEQ6cgOAj0RtbzVUSGfPumKr7nlLMy4+El4GFPBWYfMvEbaQebSGn1YCSeKgm0KZX5wjZK
	KhzYS6KrdNKyEB/xvFsEnm0Ub6+pHtjoDlaKLrLcbaIH0XZ/GOrj55LVPUuWC5SRMeRLCv8=
X-Received: by 2002:a17:90b:2e10:b0:3a8:1759:2217 with SMTP id 98e67ed59e1d1-3ade9e52430mr12674925a91.2.1793069458756;
        Mon, 26 Oct 2026 19:50:58 -0700 (PDT)
Received: from msg ([188.253.120.77])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ccc90d74sm2052536a12.20.2026.10.26.19.50.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 19:50:58 -0700 (PDT)
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
Message-ID: <20261027105031.19928-2-q.h.hack.winter@gmail.com>
In-Reply-To: <20261027105031.19928-1-q.h.hack.winter@gmail.com>
References: <20261027105031.19928-1-q.h.hack.winter@gmail.com>
From: Qihang <q.h.hack.winter@gmail.com>
Date: Wed, 14 Oct 2026 21:17:00 +0800
Subject: [PATCH net v7 1/3] xfrm: use skb->dev before dropping the reference
 held across async
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

The skb->dev reference that is held across an async resumption is
released before skb->dev is used, on two exits of xfrm_input():

  - the drop path runs the receive callbacks after the reference is
    dropped; xfrmi_rcv_cb() reads skb->dev->ifindex, so it can race a
    concurrent teardown of the device
  - the decaps success exit calls gro_cells_receive() after the
    reference is dropped; gro_cells_receive() reads skb->dev

Use skb->dev first and drop the reference afterwards in both cases,
matching what the transport exit already does.

The early drop for a state that is no longer valid releases the
reference on its own; let the drop label handle that reference too.

Fixes: 1c428b038400 ("xfrm: hold dev ref until after transport_finish NF_HOOK")
Cc: stable@vger.kernel.org
Signed-off-by: Qihang <q.h.hack.winter@gmail.com>
---
v7:
- also move the reference drop below gro_cells_receive() in the decaps
  success exit, which used skb->dev after the reference was dropped
  (found by the netdev AI review).

 net/xfrm/xfrm_input.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/net/xfrm/xfrm_input.c b/net/xfrm/xfrm_input.c
index 5ed87d51392a5..cfd5cea033127 100644
--- a/net/xfrm/xfrm_input.c
+++ b/net/xfrm/xfrm_input.c
@@ -496,7 +496,7 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 					       LINUX_MIB_XFRMINSTATEINVALID);
 
 			if (encap_type == -1)
-				dev_put(dev);
+				async = 1;
 			goto drop;
 		}
 
@@ -747,9 +747,10 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 			sp->olen = 0;
 		if (skb_valid_dst(skb))
 			skb_dst_drop(skb);
+		/* gro_cells_receive() reads skb->dev. */
+		gro_cells_receive(&gro_cells, skb);
 		if (async)
 			dev_put(dev);
-		gro_cells_receive(&gro_cells, skb);
 		rcu_read_unlock();
 		return 0;
 	} else {
@@ -779,9 +780,9 @@ int xfrm_input(struct sk_buff *skb, int nexthdr, __be32 spi, int encap_type)
 drop_unlock:
 	spin_unlock(&x->lock);
 drop:
+	xfrm_rcv_cb(skb, family, xfrm_proto, -1);
 	if (async)
 		dev_put(dev);
-	xfrm_rcv_cb(skb, family, xfrm_proto, -1);
 	kfree_skb(skb);
 	return 0;
 }
-- 
2.54.0 (Apple Git-157)


