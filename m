Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423990;
	b=EeBbLRCL7IWBbZEdIEV0Hb3dZMfa44L8YyrFrAKeOhNUIonMLGnY6P8CrcDh+ZkKvGk0
	 PA4zSrZKZxgdszdiyMIH/4IhrVNrBYcP/iwX7t/QdqVYixlox/eqTRF/dehwk63yzcJoo
	 1Fyf3F7ulpj6x/Rgj4w4NR0+SPblaA989C8dPhef7fZj2DhYyBkRHyt+/waoKywiKwkun
	 5Tzk1GMyvfYjWyDPKhctC2n0HoIGHHX3S/MpOLaiabOhEHYYxOcA63FofgNYy+ca7UjV6
	 pvHyOaexlE/0z7ZbZwRRO3DVJ8ly7NWsepJi5GfRUAqIjGDDiKMw9kx6tfZyVld405A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BwvEsrwytKYnczWN73dPkfnDgfTOzBu/1wqCOjQUI1Q=;
	b=Xt9M9TFVUCQ3FEhh3ztS9IOUVx/xlp0wiqJMFA+TGIoX92OV2nrR/9q6+hzCxvA8q+1Q
	 aAQv0bGuucHSkPmOkcOfebAN9N2JbDEPbGRXspzxVwEzDRY7kdfl16jWasHvYiXYonv/D
	 XvoWLBSocdvBpQ/Ay1572v2OwkYG96g1c2EJuicvf0XbBUcks2ytfgAVDTi9kyWc/+Iq+
	 ktGK+NNU7d5cM1iF80Yr1WC1y3uhqZ1zZcwv9/8t6zTdQ5byaacJzcT/DRLwDn/xfeaIP
	 /64noihg7ercD0nyCgNsPJmKZRllFcyJ+2zetHCT6gqmrJ1JaiO9DZC+T4ZXE/A0hFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lenRNYJA;
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0B3606C93F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:33:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A0B3606C93F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lenRNYJA
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cd6324caa0dso121107a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 08:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792423989; x=1793028789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwvEsrwytKYnczWN73dPkfnDgfTOzBu/1wqCOjQUI1Q=;
        b=lenRNYJA1b7r4MRAtOWAg4/qpU68Gcm5za8RbKRmeR5r8YTm3kL2/4kIU/FXXJ0Gyz
         VYtJkxOuQmGbGKAIlgyfG8f5awDHKuJj35Qn77SdNbdB1eLKsTTMnBXushRIbGRH8L7O
         4kRZKigWnXEYXjK8MdD9/Ty4UMiVxjMQR/JePaMaDsWSwxDP4wpslv3Ah3JlOmjhtTbB
         /ist0AlDLuZzqOmV6G7sYXAH38eUEkuox5ZF3JNdLMW1htyIGfQNp860yOb6TxLTbFNe
         FI3jett30wj3mEzkunCmHuaSBExhQlJfDF9IOGbA3Is6zWVNQtsEhAYM/dYu3+guReFO
         QPow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792423989; x=1793028789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BwvEsrwytKYnczWN73dPkfnDgfTOzBu/1wqCOjQUI1Q=;
        b=VeUvLwS848KTD9Je40R0ClnAzIp+jYCgvdaBjPCCXma86ywNsV6wU1imLvCjB2Mz5k
         YdJCUj0T/Ov9a1CdN8r/zqpNQp/4D9Uc23lbd424tOQzoyn7CosfaXDRcfdAPy95WJ7g
         JIp7c5cyxGSsKFvTV3rQdDqD8ZxdglF7wnYUa005Xde69MutgZhL0nstfi1SLR0Z+Fc7
         fmNPlpoixwqvE8RAKvaa3oHG3+/YjZ1WGbxBfJ/HAzEoCmAa304KBGNJdcRsoYkTcCuG
         vRxfkNmGr1X/0xPCUqeUCl1sRwhc5iST60xf1oCyrrrSL3F7IKrUgxUZWqVaAPu18sTD
         0evQ==
X-Forwarded-Encrypted: i=1; AKwUvByxeoMNK/Ha0KiTdpbVnOncHBg8i+V67ZTDj+R/DViEJwQvwAf9sQ5t6avbkr/Ixp1Cd8G4go04bJVDTsE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmFkZ+hvFaZc31neqNytt4kyd6nl7pVojlR+2HSGc2q51bWiP4
	7wruuDuHKYSF72EqIaC06x0qO4UoFWGZ1OvCGPmbGl0RDuckVWMaU8pTl3IOLh2c
X-Gm-Gg: AYBFou1B/vRZrMx9QSfBgoPyO8F6l7ofFOsbPIFpI8g16w7TAYXLHdmzPtMakOQ1VK8
	W90/5MRQEqWaO6vr7tMaWniNAcby0mfpDLBCo7Ja74hznCXJQA4kfVbaGaPO+AGRLNLQqe2NfMO
	UyFJhWeCvfPZu9FP33FM1slkaMczMZYxBy5k2Pwq8UvI+Z6RKWmKWF881DWtUpyXJzASg+IX/IM
	Nq/w46V82d9jxAsPwwx0y4Aq9Kc96tuJ6GYGcSy1JZ1q1uh0PD1wxWKDM0bgXoXnVK1Se+sYO3j
	pKeyCje6nLxp/lDx4EQIVNQBacZtODsSCi/7i60ka1Dzq7pwYls166RfFHqW8DnhrbRx7ahndHe
	canPjPaM+jp54SsXn3GDlfILgcPv9gC1aBpa296dr36z8T/x8Zw7kFD1D67CBA1u5T0XCnhWxLv
	AeRW03Gz4LoLQ2Vz5SSuIYaImOhl7l56gkFubcnDPkDJ0mIlz9KnmwpMHk07rMElPwQrIPPAW30
	kp7aOX1POixA6U1KdcJ9DjSjP3CAsiE/M7uhOSpjZNo5ZyIJMTauxjRVb7ybHCY4cY=
X-Received: by 2002:a05:6a21:8285:b0:3e2:19c3:48a4 with SMTP id adf61e73a8af0-3e225ec8d14mr13488749637.1.1792423988640;
        Mon, 19 Oct 2026 08:33:08 -0700 (PDT)
Received: from localhost.localdomain ([183.42.136.236])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f57452b16sm4017801b3a.29.2026.10.19.08.33.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 19 Oct 2026 08:33:08 -0700 (PDT)
From: Qihang <q.h.hack.winter@gmail.com>
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
Subject: [PATCH net v5 2/3] xfrm: set the address family before the early invalid-state drop
Date: Mon, 19 Oct 2026 23:32:46 +0800
Message-ID: <20261019153247.89957-3-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261019153247.89957-1-q.h.hack.winter@gmail.com>
References: <20261019153247.89957-1-q.h.hack.winter@gmail.com>
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

