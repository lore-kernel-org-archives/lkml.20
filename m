Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D89A449B0B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792314420; cv=none; b=kj88/laMIiWI20VFPj14On0UWx6YGfuS7z8i7SDSGN/1kCyb+LB0/BIvU3FfKtaXTYfJdNM0NAGtRSGZoDbdfZk8TRdwmdDR0X30ax/n6J1AKnCRf1yLaFxk0aln6sQZkDDLT7T8qtJmkBF8ZOjqYgLF5+lFJxFvfRMa8OBdYxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792314420; c=relaxed/simple;
	bh=5xsFvYC6ZccMND/DkkmxFEIShpZpqmArxia9I0EJPL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QXtzqjallbWZhJabbOE/D/CIwJ6Q5j56TzUps05+5mun+Q1oK1+yzIU15ZbccIItM8M/tSvGRKnDYaYa2RkSYwRF4k75B0ivpV8FY/faUqSzIN/w5DtJOvs0lDK8tyqsm+0YMLGyioyiMkUjUN1WsRot7SfEuc8To3hXmNb+gSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cupt4/6T; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cupt4/6T"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3ab866b377aso131077a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792314416; x=1792919216; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BwvEsrwytKYnczWN73dPkfnDgfTOzBu/1wqCOjQUI1Q=;
        b=Cupt4/6TG4jsLLZamRD7BMz6QT+k3Xow8C+ahYJ6v80i8tpcL9CVvPpS4BCvLro5cj
         Khh5/2uXfB1Iu6/Da5J3FWIVW0u+QsRw2saVn9EXJ+UmWkghMIBHyWOGImp6AQof9QFG
         +WKKRZg2HXFcgJJafvFdGZUMf1zhg4CLB32hnwSNnXRbh0U3kjSYKVJHIABMJRS6EgYp
         CYkY0hXEbuctFDoQT5VR4APVIOaNbhKUDOEQixZG40f0+d4TRagp24Vaka998AtWBSQe
         kQhEuDzyJp8eV3ueCCGT4X8evUuH0S+ReyqJNJdrB97wDU1t4xRhar3OuADxrEIkAo8N
         xXAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792314416; x=1792919216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BwvEsrwytKYnczWN73dPkfnDgfTOzBu/1wqCOjQUI1Q=;
        b=NKVvNaTosHVfwnrEHHLuJQ5AsFtV5TPp6vBwJj5zMJbxeqY3Rs9mg4EB0g2oQaxePV
         YAUkFn/MwmDjt+NiwyUxJHs70YtsDshO41WeEBk+/etLmW15Ho42AKSYkUdDnP6wDM0X
         6Phs5kFaumQvFx5aRFKYeZhz5nHK4XFf41hg5QLxRbZVWbV/f+bCsb5DIYjqeSQTxprL
         iUWipF3GAU05JwKE3XIv503Z5S+wQGtjVfYIDfj2mArYuOJ/r6/6M1c40hIqds2t66Ne
         N+b2zC6WXB+xNsBlyu3iGoVuGL/wNrEn3lQQZxQMn24/QcXUNCtarU2snglFlA/IDlPF
         RetA==
X-Forwarded-Encrypted: i=1; AKwUvBxcE+d00ixjgYDqcvy7t5gQOtArek3YXZK9GcUEFKXapFrJjBon5LPrkvpIoTaOGagYENSpt0ERMkzbDuo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLwnNiqnJE686P6S2i2n1k7GtmEamq6078Lh1SOU/qnkozGqErz
	xWFSV5x2MkQG1aHcV+j28WlABDW8xHb0i1R8j4JfldNFnQ1tnUFY6mje
X-Gm-Gg: AYBFou2V6IbrtkVo4iGdLmPsLVXAego+1av+Y5tdVODLd1cE80cHBaG/Fz/BFXUfkKG
	02tQHyN3pD3BRf6JtaVbrM4g/kL6nPLQbEJogm9S0FipK1rn9VRtUHY4gOTQtPZZMV9cDGRh2vQ
	ZMXkO0sIaHstEiAKzi2lAUQ+4bZqzJofqszCTp4D2Y3YqKUOTWPQJonfuUVx1UTQ2l9IzOLp1dV
	7xPTU6kdbN8RQdFr8dnlenklIHiIeY+c2LidviSfDlwBuoqSy4LjjzWfk0dJPT9DtWwRm8FZ66B
	PagR0fNcY3w7BAuiMXwL56MZpZiN6q7n7SS0SAGpfvrUcyjEwgRETlPzB/KYJ5WJaTeAUY5Gmer
	jC12SXPo+5wsa4rtDFHTfqtbFI2o/gtbBvVCi+/LrgzPYbmOjNwGlLw4mrp4u4eMVulTNyUCeRb
	o5jt/3fnSBM8BT9eg9BIjSzVzI7fgeNzpwfrzEG084B4IjjQRzscbMU8cJTQAS0R+9fRTrCz186
	qhEATBuJuw3z9IE/FKl62h1jvcvsl0Ejuq1WvM+pvBeMqTaXj/Yp1RprrFsQlv39rdJ
X-Received: by 2002:a17:90b:55c6:b0:398:bad2:c10 with SMTP id 98e67ed59e1d1-3acef1351f3mr6411270a91.6.1792314416632;
        Sun, 18 Oct 2026 02:06:56 -0700 (PDT)
Received: from localhost.localdomain ([113.102.237.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac947928b4sm15580675a91.11.2026.10.18.02.06.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 02:06:56 -0700 (PDT)
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
Subject: [PATCH net v4 2/3] xfrm: set the address family before the early invalid-state drop
Date: Sun, 18 Oct 2026 17:06:37 +0800
Message-ID: <20261018090638.55686-3-q.h.hack.winter@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261018090638.55686-1-q.h.hack.winter@gmail.com>
References: <20261018090638.55686-1-q.h.hack.winter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

