Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1AAC3E7BA8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336335; cv=none; b=Yqv/VgbVUujTyejiUrG44ESruavQa/DXogY+4CchHhPedtLGvImiMEqks68fVAoDkZ+BSF2aePbMfi82z7ywf/oEv58MMqfOQVSnUxcnViVN0jo2z/M8Tss15dSsfyIhbuDFFt0bm9rlO6nHZb6qJ00ylkXwuc+9QzhDP0DTLAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336335; c=relaxed/simple;
	bh=zY1FtHsFvhZmr1r51XZIN6gnDmySfJ2JQJfMaOFqjAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IKWML9DaHmuq72EPkaX6HORD2VphZzSH7Vb4BsNIdLxaO/2pEJtWpb6ZQosmDtBeBCcP1mLsZ/Rtg19M/9ZDXlYiBeQZ1R0WcCufjAOgvodF9rdaJg1J+UV/uPPrxjTReA5/El8PE7tV5dPcdKkhoI0y8bSY/Ga9em2pLZqU1Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=iXBbEivX; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="iXBbEivX"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so6562535e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788336332; x=1788941132; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4Vc4iq3TPgEkaMSVSCPjErXwdDQEeK6K78XniZIP9s=;
        b=iXBbEivX1+W+t529Rcjtz2c1XlKsEPS1jM75ZGnaN97tQYy0wwnN3l95l23pqFjTqP
         k1MKKExp5uEsra3gF3Iv1LonhRrGyM+6GNQ8xWhcY1Jb5QIj34W5vXjDDY5oj7WFl1RM
         DlO6IJAFf7KjC6jk9xx4qAKfywZw5RUHaz3nvjFoOdF9NhDZpSa/wXd99qXpThvc/Ne5
         nA1/pZCUUJhlZB6IrSJQDJ4+djSNLwA0skALx53fnatGrhb1H5a1k1l8CXRxRCu1sg+/
         t50D4erNFHONFn1IEKsU+DrSrpamyCcaIGIzl7NzfBeWIVSy0qHpQvb8G6NP6bB7krkF
         VPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788336332; x=1788941132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=s4Vc4iq3TPgEkaMSVSCPjErXwdDQEeK6K78XniZIP9s=;
        b=rpmklD4VOrij1apqvrDYjAL75iZyHXI6KCN8DEPCTIwMwci6Rgm8MgU1ifRyXl8ZE7
         6LRYEmWH7xN4D7EjxvMvZf1Y2WhuCKzjuTotQG6t6Waf4L831mEz6MUGuH+KWugaoBpl
         BUS6UGbeXHjZVUff7pUgEP0HLw3iCVEwYoA10YSstJJKcNvZbisLXYz3dtCab3hfT0px
         HbdkvLiOiS1LPIhmeQYJEqM4v+tzEUDJ62/BSdPmPixfTjIKuhEJEbpBCR6YqCDVp1yo
         556s4IKnAmeWzGvSgrVAxAMjqBbQ0awEeos9wYSAM9djcqCw4sTOVDTnyGa9BFe6OW0D
         qaaw==
X-Forwarded-Encrypted: i=1; AHgh+RonziL8KIeKdM8oXNUdLc+yecDp/bYQTLg5bMTLyLXaTksACvMFO9Q4+RzUZQUqCWj8NVvOB7ZtXDHuwVs=@vger.kernel.org
X-Gm-Message-State: AFuF++kNMgz0/825EDQ4KjTo0/3OE6RXaRdcIWUyL31H3JT2XLKcOB86
	s4xkgojr5HBwYzf01D3H+0ZTHleHaxW8P46D1C1zLjcIJtviycyiPDzl5QkWuAAYPhI=
X-Gm-Gg: AR+sD13XKJYTorEWNdd3iML8oiEd0yU9bgQkOJT17k0D616PDv6tCe/5KZAvocykKbw
	rdgEZQUdkBcP1ptlJ/7OssdkzrfkaJQwjFHzHRPDHbB8hNJXxCYlZ3NM7g2ZeluWII95sFc7cBM
	kBVJieUDcMe1OwfmVGs8/z0KGtIvIo4b8n+ZmX6MOzmO3DXcnP0BrjML3HttEAe5Giupil9JnJ7
	70qngKLpQgssEX4hyXssaDB4RHvd6ses0qEV3G0bXNngp9wCggal5iVroEI5/4sGFZtG3JhJxQU
	multhcI7g5PjChdRztBIsKXpwrBP9m+dPfkPFHrZXVkwCfjzxeeM5SeUPwnVdlUdN6ykrTtwL5m
	uGQtJf7cvYo8nRLwzZGb6TA6y6yx69S4jYclP5pfaVbONFIxweTgUkJU4Y/DObzGJlF3bW+K8r4
	PAHTcWZTQiGB72IgnrtZyaGUD8KOaGFX/0vIVJQLA=
X-Received: by 2002:a05:600c:8a17:20b0:49c:d818:8771 with SMTP id 5b1f17b1804b1-49ce5808d4dmr37954585e9.7.1788336332155;
        Wed, 02 Sep 2026 01:05:32 -0700 (PDT)
Received: from remote-01 ([84.17.55.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce7dd5154sm17766875e9.2.2026.09.02.01.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 01:05:31 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: "Th\u00e9o Lebrun" <theo.lebrun@bootlin.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Vineeth Karumanchi <vineeth.karumanchi@amd.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 2/2] net: macb: reject an unknown link speed in the taprio setup
Date: Wed,  2 Sep 2026 08:05:28 +0000
Message-ID: <20260902080528.2211468-3-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260902080528.2211468-1-f@lex.la>
References: <20260902080528.2211468-1-f@lex.la>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

speed is a u32, so SPEED_UNKNOWN arrives as 0xffffffff and passes the
"speed <= 0" check. A taprio schedule installed while the link is down
then has its hardware interval limit derived from that value, a limit
that rounds to 1 ns, and the first entry fails with a misleading
"exceeds hardware limit". Name the case instead of relying on the
sign.

Fixes: 89934dbf169e ("net: macb: Add TAPRIO traffic scheduling support")
Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/ethernet/cadence/macb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index a43855db1e45..81530b9257b2 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -4324,7 +4324,7 @@ static int macb_taprio_setup_replace(struct net_device *netdev,
 	}
 
 	speed = kset.base.speed;
-	if (unlikely(speed <= 0)) {
+	if (unlikely(speed == SPEED_UNKNOWN || !speed)) {
 		netdev_err(netdev, "Invalid speed: %d\n", speed);
 		return -EINVAL;
 	}
-- 
2.53.0

