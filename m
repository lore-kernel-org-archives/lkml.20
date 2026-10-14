Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792639617;
	b=gPzgtZQ9cQT9OAIvGERxpk4QLgqSQVb4juMk8iYBX/IvVxxyrc6atfn/v5EpWQ7Tb1tU
	 kCxvWAWyGFlPL/BNaKfz6R4Q4L0ouMekSIQCBiCm0D7M/XyAEyK4geh3Iblu44uTXEQsH
	 xlDB/K8qYBvVbceqWEW7iElG4tsBi62lSRb2X3Ww6QS924DRNKVr1Cn+8MRKEo8FTYjd0
	 53SgGouP8GCqY6obHtBN0oxX9G+2LAiXtlBOHiFY7PIkLbYI7du/5F+v81jFfkVT1sxgz
	 SKr6Juh31p5R1qTdCbf8uG9oIZ40jhc4jdoE7Gawn2c/+X1tt0LPTX9CNcmcIoxllQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792639617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 To:Cc:Message-ID:In-Reply-To:References:From:Date:Subject;
	bh=BwvEsrwytKYnczWN73dPkfnDgfTOzBu/1wqCOjQUI1Q=;
	b=PAEnoWr/SKt4DcnsoOnMfKU8/NN7/Dc3DAIUXkxZ926784fdOT9+SwZlWEmjDXs83m+Z
	 GjBQO7Sc7h96GU8qRPVM+yDUzq+aZH4i2lVSxg5vfLqNBwyulnkq6Y2cE+0xAK0RqRpyV
	 Lf4Dps7Wp+8FR47niOLBoLJkRI/4wYCR9noaoF7JlF1NRyMak7sj896c02Zo2m50hLezq
	 EBb6tLy8MEDNIoDUEe8Fyw+QqOTQVEf0MsXokYDDVa23jNxp3nIscyiiFhxWKn4p7J0Hk
	 86p4pKmzHVZkRs83rkZLvSNDqmN5M2xwWe+yDJSu+oj+owrxuIDHut3lAo0i9EHZMeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RenVvBTx;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFE8606A31B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CFE8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=RenVvBTx
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-396affa9420so155020a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792639617; x=1793244417; darn=vger.kernel.org;
        h=subject:date:from:references:in-reply-to:message-id:cc:to:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=BwvEsrwytKYnczWN73dPkfnDgfTOzBu/1wqCOjQUI1Q=;
        b=RenVvBTxZ+Mns3K9tLrV4+1ovu/2xr3hcpTL7DkNDbOTeM4gnqUSJxEpD8avUSPXI6
         qov18BSMaXFgrcGoDxo6FWDlFuubqeR61Y4PDxPLdp9ilCDoo+nAm0OkWwEskAfDMlaE
         y4Ncd5Xxo6VBEpZ3QE6VBu/UBpEWzA03W+iy52G8Wh9YASgtxm53UhxQ3TYYqXTygAuU
         1ViQbjBrAloqMu2fUJnE6kkBzSOlYtPz0sJHu24PJo4kA06SerkDybRmprACcxj557zz
         mYGFkCLMxSNv1+cb19tamtvttLwetH84mszKLVm2JlRHPA6xWheNQlS5vFBqAu1POg+C
         oAhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792639617; x=1793244417;
        h=subject:date:from:references:in-reply-to:message-id:cc:to:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BwvEsrwytKYnczWN73dPkfnDgfTOzBu/1wqCOjQUI1Q=;
        b=chi6q8JtQAMObT2KzbdO6TThYtFDrDTqbPxHAentWTMxdT/bVDCBs1PIAG1NfqM/6m
         8VCXeOm9EAqpWEG7u9QPz7X3FIZnOQ/C6TZYUVzBJXTqqUlI//nVs36OBtmUSQK3Deex
         AjfLpxxrJWTA0xqPfbS1kHEdO+zFjSBj6RHuVwezsy6mr7IreqscxMnp4Ebi0z7mEVrS
         xH78DkCOqzHOEXS4Kua0fcTAnntkH5IWAcmJYCz9/ZpSBKirIFVwqL7kZKyqpRRdwnUF
         Dy/mUuTbUtIwZafC4G7E3wUhkJ6zWcy3n02iA/bRaepONGTxN28arfi9LJ+2uSRvQiAB
         3K0w==
X-Forwarded-Encrypted: i=1; AKwUvByfKOAg5N1iWQBe7O7dWp7iZXsXeHwK+HLjfZmqimRMRApIxKAK7kx9Ws7gKYZnLk+Zss6Bs3YoxieP2iw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrEyWEJpVD9b7GE3bF4CBJrqLcOwNCqEChxgFsGYlSqfSzkAoz
	t9ZqbQV4WhnysAbRujv2mn4aBO01DfTW3HRzsrDOZCwkg0YWXKd3Vp71
X-Gm-Gg: AYBFou24ssSDb281BhjAcajW8Y8c7f6KDWQ2jYw+Rh5upsZSEQija5SAegvErp0aqVG
	TgT9jl0Puy6t3lhPyqMi7A97ztkiI0n7KFMoPFFn20Y5tgILfs7XerzJuu0vqEC5K92E4D2J3Ut
	lsTX5/N2Ke7Z1hZnDNr9XsbhHGJf86Fzt3eFpTbC0OcKJtiZm4xOLdZZXhGdMJihxTF+phqreiy
	IQEnPw/8hZdpqF3FPUt9foOtY/prFuI7IQvRhMzlSQR9ytd0a1hWIjFOQdRRNA3XfNrD8aL6d5s
	iaDJalXyHVr89AaR8NPhzcy5TqTjyUq7qtYW+QPnzFAcRmr/RyKOnyZzJB1usKWMJdDj2Y3yhkS
	ToghxB7WDhygv8xSzkrBZf7FFc1LHdBqkLm/68gNfbtlK/DZKDhoHyfNmY5acXC0nK/PaQTd9Fx
	4hyHAHBaUcCL4b9I2fzHM3SjFyN7pNBJXkw4+OYRVI8wMrJIH45yCnLefgpM89Pgd71P/cdJ8ED
	HhMpve1QqkX0HpaoFku0+gt0ANUSMhLO38wSN+svFNlvxm+ro7o8/ozRs2QHGLpZDZToWbHGaWi
	IUJcLjz7+fNb0lot7T7z8A==
X-Received: by 2002:a17:90a:fd8f:b0:3ad:a84b:df1e with SMTP id 98e67ed59e1d1-3ada84bdf58mr1133264a91.1.1792639616869;
        Wed, 21 Oct 2026 20:26:56 -0700 (PDT)
Received: from msg ([188.253.120.76])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada48ed719sm2049343a91.5.2026.10.21.20.26.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 20:26:56 -0700 (PDT)
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
Message-ID: <20261022032129.16118-3-q.h.hack.winter@gmail.com>
In-Reply-To: <20261022032129.16118-1-q.h.hack.winter@gmail.com>
References: <20261022032129.16118-1-q.h.hack.winter@gmail.com>
From: Qihang <q.h.hack.winter@gmail.com>
Date: Wed, 14 Oct 2026 21:17:12 +0800
Subject: [PATCH net v6 2/3] xfrm: set the address family before the early
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
index 94de4f698c33..517369ba9efe 100644
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


