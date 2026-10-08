Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66C02DEA61
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:29:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791426558; cv=none; b=lAut5qu9eO0gm77Np0K/tDHAqSfijITr+gXUenZk8b2RrmQRBpaL11S6LsWn+FIIGdAk8L7p7anB9JTUxrCwk4hNQG2BqI61Zxe52thTy412K7Fytnk7fWV9rSTtSpOCLCTfTOoid0PCECzDdZronG7yizd7sISl6A0FI082GpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791426558; c=relaxed/simple;
	bh=K2zX7urvjPwy2TrhU6XQVJzXffnHDfc5nWvRgj55vJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DyhJpL7JSvAI3wU5/ZU6DzsUyEOTWk5n2Jiso9rZbmqZJ631P2XD9t8PUpFSL0o8iyn3woAY0Uc4ecZZYgICwBbKEx0qVibq4NQfAbhQdnafsIgw+b2KXefAP3dx5COLo4CfpDwSHrmtnG29nWlgip0hnP0E1XDxwID57oed7vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JTSuiQZf; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JTSuiQZf"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2db18e5cb56so21294165ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 19:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791426555; x=1792031355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8nU5jADcyGgWP4KIgDf9MaVyFEAKHWHZ95cmiPzpazc=;
        b=JTSuiQZffJ3nl5Tth+vOU+FVW5wP6AkE9ZjJcrY6w8pQ32VHZ67qLCg1V79FPJSyzk
         n3KhjJNR+079eBQrr4yyqIvYLIC+AY36hxiSyHxHn3X38frf8kI362izb472B0AhD38j
         3J40FTdO6tp+JXXH8Xx6ZAbtcBSjrTCCxBKTjj8U1oarEYzaaasQ6Zu0yz1zQ6k7asz7
         7Pq2mcHU5Ck5bYno1elofucy/3dRuQKO0iPHon0LE40YPhvhmXtaUMCv0e8xmbenR2Nr
         AOMLvWil5m601kFDJgfzTsR22PizmI2WTW1zMe1AGiPZpZ2YP+x8q19T9/CgfgLXTZS+
         fMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791426555; x=1792031355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8nU5jADcyGgWP4KIgDf9MaVyFEAKHWHZ95cmiPzpazc=;
        b=LbvWNAnOOKutWG21j0fPXsPHwAFafrYu+1TM+dPKA6MiINqgXg2Bqruyjhnk+TP7zM
         MyFfo0Kc3XaZOVVjBxuQUKHd7WNadQhtQNj0BEC8rqwgV0DS5DiGd+Bk5uVQG+GLRtm6
         oED3VoyNjNN5DC6+cYlMfQHYTIUNy/Zv3mQht1OtR9doeudSWEUKL1OOaBBexoXOIwnT
         +lF0WoYYOLwwlaQOu/mIBI1SkvSujyqHryE9eg3AddPVqKI5mrpOAx2Oa6zQWqQXM3qz
         liDCId9pu4EI69klWBJw8boV276SF5CFOqjmlvzGALaHfH0WoaA/QNv6V1ObAtt3wE5k
         5XuQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6i71k7BeDad++ybJulkI18fqJTxfC+HTyAoXDOB+RT0hPXeJpxScRXvrv38MYpGJPHxluFZC7trDuApc=@vger.kernel.org
X-Gm-Message-State: AFq9FYI/y6j+bIRTwr7angJa0d2vjoTVlMIyubc9pvlRXDonaV/GsMhM
	az68SK7Yvh9r47AbnLldb9KJC7q729okou1IMH8CpoQnQ49V57ZYsShp
X-Gm-Gg: AYBFou0+G33xvHmMSO/jbASgJTD3WXbFqlXDuGettuA9DlR5QEAusFp/ogiHRqZT4/l
	2L9Rvc3WsXt6mj73RIvVs069EIONvKLoqA5GXdK8m5ZPVcAQ0uPZzetTZNkfnr+Pp5CqV7BZhKs
	qflzonv6y3fgrtGJ74r0gzi9JXFlGUjrDzeIhwWLXgXK85M91p9wo5MzcdzjjSou3DeIueO+Rxl
	uiDHAL4V72nPtDcvOTPJxAiBt46KBeTazMsFcknqvZirbxOT5UoGp+KRgiu7DLwN16DircYmL6M
	pna+MB6qS3pnr38bFIvlUKZGjRRI4JcgV+Vy9u88n+QXxFL5N0FIpepMzjvK3aiH8xXMePMbbx7
	epjk5jDSuWecKw8ks1peeU05l3eKdpAGriRRGh4XbBUlNnL/UFJqbKvgQ4l9zbpRkBFpiwzVc0U
	Tguhn09Lsqa0j4uaBs9YoviUSo8B/QmFOzK5cNFmqloQ0USxjFR5gEXa1NCRIjzq2KVzmDyl34w
	fklKAjngPhyL12GRUAHlcxcoA==
X-Received: by 2002:a17:903:2410:b0:2df:84e0:9021 with SMTP id d9443c01a7336-2e5ffae39d6mr35622525ad.7.1791426554896;
        Wed, 07 Oct 2026 19:29:14 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482cab0sm18045865ad.50.2026.10.07.19.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 19:29:14 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 08/10] net: ethernet: aeroflex: move setting of netops to fix crash
Date: Thu,  8 Oct 2026 10:26:50 +0800
Message-ID: <20261008022656.3592191-9-mmyangfl@gmail.com>
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

greth_of_probe() calls greth_mdio_init(), which connects the PHY,
before dev->netdev_ops is assigned. phy_attach_direct() ->
phy_link_topo_add_phy() reads dev->netdev_ops through
netdev_need_ops_lock() since the commit in question, so probing crashes
with a NULL pointer dereference when CONFIG_NET_SHAPER is enabled.

Assign netdev_ops before the PHY attach, as was done for emac in commit
7c9f391ec89c ("net: emac: move setting of netops to fix crash").

Fixes: ded86da4bbb7 ("net: ethtool: relax ethnl_req_get_phydev() locking assertion")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/aeroflex/greth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/aeroflex/greth.c b/drivers/net/ethernet/aeroflex/greth.c
index a593adc16c78..fccb67beebee 100644
--- a/drivers/net/ethernet/aeroflex/greth.c
+++ b/drivers/net/ethernet/aeroflex/greth.c
@@ -1421,6 +1421,8 @@ static int greth_of_probe(struct platform_device *ofdev)
 	/* Check if MAC can handle MDIO interrupts */
 	greth->mdio_int_en = (tmp >> 26) & 1;
 
+	dev->netdev_ops = &greth_netdev_ops;
+
 	err = greth_mdio_init(greth);
 	if (err) {
 		if (netif_msg_probe(greth))
@@ -1498,7 +1500,6 @@ static int greth_of_probe(struct platform_device *ofdev)
 		dev->flags &= ~IFF_MULTICAST;
 	}
 
-	dev->netdev_ops = &greth_netdev_ops;
 	dev->ethtool_ops = &greth_ethtool_ops;
 
 	err = register_netdev(dev);
-- 
2.53.0

