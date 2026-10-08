Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0E63A2559
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:29:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791426552; cv=none; b=JZ4lxEEjhlxaJzFdeIEjXA0njX7SYA2cniWnez0gJu43hiM09uirOIp0d1DFxFLqpqbXai0WEti1uzIu2u1+4kFYTBtOIngtkXS7a5FCWv/+49Ss0aE0gu1OLWLX25OT0HpCtdJCICZ30rtagGOJ9Gcp7z3XrwJI/r2CkwhWySs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791426552; c=relaxed/simple;
	bh=nU9QI7lMrwi5fwz2h6IFe8s3YbLmKmlNRTkcI+D/iCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IbjG2U57IKhY3OygHhg4hKStqgpdqB97ACEtHBXCHk7KbWMJ9/1UP4k9pqt+h4VFBDo6+Y2ucQelblnonriGsdgnH/87cBsiqRVbtlgVRz17WCxbSPlptzLjJjMyMwvhR2ET3xD5C7OsdARToDKOnJyC7TOXi7Nf6wv+rcuWg0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmvxIQ6q; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmvxIQ6q"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e7006bbf77so4615065ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 19:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791426551; x=1792031351; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aeu19lsuIXp4350R2VFt5HGY0igWCtsP+eL+xnwXOpg=;
        b=AmvxIQ6qfylWDb8qih6iXXkyar/QZBrvIE86zyNQrJ0J5ujKXbPuco3+Z/dExaF/RD
         ZhWLqLoYlHWPnm7mVUO/gHUiHxjcxGRCvRzpdF1A+Y5JROC4jWdfdn2J7o/W84r4xM9n
         wymXjvbZhfvkE0byisjpzliFzcPJJvlHRjbmEcC0+ieOXMu0ywG2gqFHVdZqFCRPmQgY
         4B15dpJVdpC+9R2VD7xhNO67gnC2W8ody1cK62Zy1FJetg1sEKgxM0ZE1ecmqAt376s2
         mUchtX2gieRpwqdff/blB/7dH1xXqWibW13MuyHlmZY/B1/tKM/uZpXcqvK0j+s8WOl2
         /aMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791426551; x=1792031351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aeu19lsuIXp4350R2VFt5HGY0igWCtsP+eL+xnwXOpg=;
        b=FB4TzKbEjb1I+DJtXRRAFtXo+8pjMgE39qi0nlC3vCQjAZANijZpM147bf78NeWQwP
         6oar8vzGEj2MkdZbLzqyKV9BfZulclcus3ZTb5ZzgkN5z18hhoul3L9fYCxnHPjDoe2q
         z3BkgLyxFaVYy7zsyglk521O48blhj8/yRAmYFSbZn102ik+/P/V5aGRZf02Zo/k5RyP
         S4nJxjkxSAp/in2kqlIV7PK5B9/AVL7hEBoyXMNrsBMh7Di/0/kt1QvOGAY6L77Ghw2G
         qmk9MpjY6EjPeJ2vaswxqsdy+Q5GdWPdeFgWFgGhMnslLvvDcz086QWrUi3NDcslAtBj
         J/Ww==
X-Forwarded-Encrypted: i=1; AKwUvBx65Iz/azaMOmEZsx1JBZeYAJDvLjOHMcWrWw9KSPRQFQoG22tDskFQFgYjAllNOFvKGx5le8tqtZfpa1E=@vger.kernel.org
X-Gm-Message-State: AFq9FYK3pk+XWM40ta83iHJzw+viuPzQTJZoxEt/m+YZCSFQCIyr9zBF
	BfiAQAqBp2azpSm6iqwVEZAAolDUUh55KdlSeNPRSb5U1onwUvSQPsLQ
X-Gm-Gg: AYBFou2AIteyqaK8ZIta2RBfurT8CxjvLjboOGzouanBFAxyAOf4jMKrS7xFrDfW2gN
	0R3BPlrFs7Mim7ovwsNHipfJXaXunmmDh2NhufXYkT5aMwV0uTmQh45PO5HS71lOoXIPj2ZhlK0
	WubI2VxV02NqdmkMfHtPKGE5R501P+8H4CxMLwe3Psp+vppjk6FtQWBD19LvTLHZv7Vv8BUmJEx
	hozZEovNqzhrbIygcrG7PoQ1/2+lf/l8fNNLpuObHkHJuYQdnWDj75Mp8RKSwecL9ghvoOrhvEG
	4JYACb0eqCGfIauuhXXVHh/zDyJwXecAvzjps0hwWh7bwdOGzmAbRUS/qmydsn37V+WqffEBUME
	4YtQ56cjjNkq1MBS7pbEtE48+8P/ombiYp14sK54UbKs5roTjyUZnJ+cgEa6o1zwxxfCNJO/s/v
	xs/1huRIjLn2gCe8rSue26MEJXpG3tAlsmyDiuZpIApDUnvaEvuJkub8H1Ze/QukAbql+BGvvPb
	Bj0UoL4j4lLjqlRAkqVfPyHg6s=
X-Received: by 2002:a17:903:3905:b0:2e5:e542:fe34 with SMTP id d9443c01a7336-2e5ffae5a84mr39318505ad.4.1791426550965;
        Wed, 07 Oct 2026 19:29:10 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482cab0sm18045865ad.50.2026.10.07.19.29.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 19:29:10 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Jacob Keller <jacob.e.keller@intel.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 07/10] net: ethoc: move setting of netops to fix crash
Date: Thu,  8 Oct 2026 10:26:49 +0800
Message-ID: <20261008022656.3592191-8-mmyangfl@gmail.com>
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

ethoc_probe() calls ethoc_mdio_probe(), which connects the PHY,
before netdev->netdev_ops is assigned. phy_attach_direct() ->
phy_link_topo_add_phy() reads dev->netdev_ops through
netdev_need_ops_lock() since the commit in question, so probing crashes
with a NULL pointer dereference when CONFIG_NET_SHAPER is enabled.

Assign netdev_ops before the PHY attach, as was done for emac in commit
7c9f391ec89c ("net: emac: move setting of netops to fix crash").

Fixes: ded86da4bbb7 ("net: ethtool: relax ethnl_req_get_phydev() locking assertion")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/ethoc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/ethoc.c b/drivers/net/ethernet/ethoc.c
index 0c418557264c..e5b7df43e8f6 100644
--- a/drivers/net/ethernet/ethoc.c
+++ b/drivers/net/ethernet/ethoc.c
@@ -1211,6 +1211,8 @@ static int ethoc_probe(struct platform_device *pdev)
 		goto free3;
 	}
 
+	netdev->netdev_ops = &ethoc_netdev_ops;
+
 	ret = ethoc_mdio_probe(netdev);
 	if (ret) {
 		dev_err(&netdev->dev, "failed to probe MDIO bus\n");
@@ -1218,7 +1220,6 @@ static int ethoc_probe(struct platform_device *pdev)
 	}
 
 	/* setup the net_device structure */
-	netdev->netdev_ops = &ethoc_netdev_ops;
 	netdev->watchdog_timeo = ETHOC_TIMEOUT;
 	netdev->features |= 0;
 	netdev->ethtool_ops = &ethoc_ethtool_ops;
-- 
2.53.0

