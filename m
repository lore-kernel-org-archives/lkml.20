Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E03B22A4F1
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791426543; cv=none; b=RpfKLx2ak2AOhuOJFXsTtIcwkG409tJqk9cOGFknE+168pLXKJsvmtH1wSSbetcdSxRlTcZzsc0F4o91QPdg8wTNTU5RYrZmyozZNHcZMvGoxb0d220GKQFgjYJv0HQQ5UJd2wR332mQs9ZgSP44a4sU5IgYVRXPkUpIJFCgyTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791426543; c=relaxed/simple;
	bh=4dfg5Q0rKQdILfU9u2v+axCjBWUm6KwVuVNePORcz64=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mjvtkI2ZyHNFIGq8wXyrX6ONpK4yY4S3xBWSIRrbMw9gcc6MjiEDBNr6c2yGm55k4m1UcYHzLYtdVd99XmNn3+Xmg3G948cq1cBFgZcguyWw6GJJ0BtMh+fU61CxkoTGtaOoJVYGSv6wu8kwbKqrtXoP6M1N9VpeotVwz9tGECk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hp6/e2+G; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hp6/e2+G"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e5d0ee1951so14422545ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 19:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791426542; x=1792031342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Szl/KezNtI9Hsgxs7YZnv8YwFDL8usJvMfWhCZHBjlE=;
        b=Hp6/e2+GTxoty8E4Yau7C/tjNvmvntgzluXuAnnD4KHMA+GOp2GJC7CzHNOKwx6xFO
         vexZGY8VtCd9TluVWJ6YfkizBoTgkbWAr+xW7RemCsmmCd+MRutUtPavZ2t97V67kg5r
         uvmA4SXq7JCY4wUxvkxVbPrZ+hile5ClFfweQy2x6SoFZ9qkk1EZSVAuG+AYJY6pKGJ7
         HQPFp7335u5Jce2isT3bW/5740TalktQIaxfP/kYsKSEwOWOnzMcMNgOY2TMJgYmbVq3
         NcfXqMEgABpFnsFmpqAuIynflPw57J+MT0myzYjf5miMfu+bpI3IRiW3/PMtJUvabARb
         RQVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791426542; x=1792031342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Szl/KezNtI9Hsgxs7YZnv8YwFDL8usJvMfWhCZHBjlE=;
        b=rAUVNgKJHU91SHvJFa70UXOD9Rz5eLftigPPkZCof56LgBvTd3NLjQca/rNyLiyWMU
         eCEBbGejO1cL/oM7pIqe4Kjp0dY/xun8NjBTWQSisi4UffaYzWCAlLxqpWpJuFnpsId2
         /0lx2i+aWb0VZpjBnQLj8Yz+vZp4/xeUcFVfq7+HhlDaHcFJ2crtBnAlM+RyN3KAtPX0
         TQYxzq1CXwrC6FElQjDj8EcvHoQyTJJd3qv6e0xAJUi55HfJsfIaAM4cIhDzzRka5iBn
         F1GM6AFszcqv2IdhhuV/GmlVnPGfIzVequYGftZ6CdqnNKmaf9igg4kZC4UgOVQR4TMe
         4NMA==
X-Forwarded-Encrypted: i=1; AKwUvByiedIJnozKe+sYYocTmq6r3u1r11/CZq9tstAFFCP/TfkCdI1W4mMy3JArIP71C6RLUY1SIyB7IdzLnQ4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOTz+GEBPPvSRgHISaRHIausDaDiYnjNZIirOYMoY+BLe52sAM
	/Ubm2NDVeM3M+6V0syQH4ofdT3b5xaDthD8hWB6o22il5kVNvDU6glK5
X-Gm-Gg: AYBFou0h1gu7Gxk6/QPenz0adDqpaYVeJ8RnwOO8ukjQ8pvyUePhD/PAOVnuEP2RTBC
	lkR4IT67T9IcCwp4i6ZDVXqu5hhMxr7UUdzM2bFZZ8jLZUE/h2+JwUoDbwVR26qmK7oomlj+lOF
	C/zUlS6pMRyOY7BcyIaEWjBftlTgX+U14MVsW6n6jZYK6eoGn5D2ueklfXZESPe3/AH4B3YVW15
	11xSAu8o+M7OcxmYh2FjT+8BCjy5VfMB74kfBI0AW/67PdMSzsRjoc4C/BpPdPver5XwMKNELbg
	8//iVQYQYkqNx+k1c+ZXr8Hm7HjO0OdfbmLFA9yVtxg5oP4WxazQGG6TRoDxK4HgtHyjzcrRq2n
	UH8NNi37f8AEET0aDfmKKE1JOLD21FuxPhY/9DquhyA7xGHFXZxSmLq3Ar4fDhqS3vRKnIFEXND
	yGMX8gRLA1SGI8+5Wxaty5HIlJoYtUnu308oRSTmFQVUtf0H0EncNGNvXhMb2xImvcjpChPCHwP
	8T2L4OvSVpYs99Oqhu5HpWFww==
X-Received: by 2002:a17:902:d987:b0:2dd:68a4:16f1 with SMTP id d9443c01a7336-2e600388d12mr37379625ad.11.1791426541913;
        Wed, 07 Oct 2026 19:29:01 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482cab0sm18045865ad.50.2026.10.07.19.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 19:29:01 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Jacob Keller <jacob.e.keller@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 05/10] net: mv643xx: move setting of netops to fix crash
Date: Thu,  8 Oct 2026 10:26:47 +0800
Message-ID: <20261008022656.3592191-6-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261008022656.3592191-1-mmyangfl@gmail.com>
References: <20261008022656.3592191-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mv643xx_eth_probe() connects the PHY before dev->netdev_ops is
assigned. phy_attach_direct() -> phy_link_topo_add_phy() reads
dev->netdev_ops through netdev_need_ops_lock() since the commit in
question, so probing crashes with a NULL pointer dereference when
CONFIG_NET_SHAPER is enabled.

Assign netdev_ops before the PHY attach, as was done for emac in commit
7c9f391ec89c ("net: emac: move setting of netops to fix crash").

Fixes: ded86da4bbb7 ("net: ethtool: relax ethnl_req_get_phydev() locking assertion")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/marvell/mv643xx_eth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index 9caa1e47c174..38b4d65f58a5 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -3171,6 +3171,8 @@ static int mv643xx_eth_probe(struct platform_device *pdev)
 	netif_set_real_num_tx_queues(dev, mp->txq_count);
 	netif_set_real_num_rx_queues(dev, mp->rxq_count);
 
+	dev->netdev_ops = &mv643xx_eth_netdev_ops;
+
 	err = 0;
 	if (pd->phy_node) {
 		phydev = of_phy_connect(mp->dev, pd->phy_node,
@@ -3221,8 +3223,6 @@ static int mv643xx_eth_probe(struct platform_device *pdev)
 	}
 	dev->irq = irq;
 
-	dev->netdev_ops = &mv643xx_eth_netdev_ops;
-
 	dev->watchdog_timeo = 2 * HZ;
 	dev->base_addr = 0;
 
-- 
2.53.0

