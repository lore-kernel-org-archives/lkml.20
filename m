Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72F433CEA5
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791426536; cv=none; b=PN2PtsSu6MNMaYtx38n4UKWCSH0HOIcojSwQkgt2gUtbfHk2BQlKxvzdBm6eMqeGmka1l3snXH8i9Y8AJ3t1McdbQ/bsZBHBM3WnPCMi4t9o4AM5RUTE7V45hYndPvTn60CFS14pF8vwn5vxcppqPvFCX24aYfxFKy8jW+8N+Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791426536; c=relaxed/simple;
	bh=yQ7griu5XhD2aPhu4HbCisP++1R0bq6ceS2ER3eOUL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U1LolwnI1pxgqVirE95bZHiXE+MjbP/vtBGQVw/R345wOaDK0XoBsk3VrfVSMrNWF+ROj78Uv4RsyQ0639+Xg++s/zdb4uQZLIZkCupH/NSZ4pXtfQLs+Dns6PyY3WBAO/7x+pvJ5tDeq7Uhpisz4NB+Ss64XfOE/vj6/qHXtQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ct7FEEzx; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ct7FEEzx"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e812e2b31bso755445ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 19:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791426534; x=1792031334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cLLDCAsceokNY+xwokpVffSC3XQbfRGpIBX8r0xpvd8=;
        b=ct7FEEzxfZCawDvO1ssmUUFPlTUeMm2Z5ZDG8alfAeCGBQhy7OfPR3eGioMOp8cRTL
         KCHRMkQFatz7idV5ZTuWkEmJf8GOOuH0kwOhBiU6JiEVr0ZzQPNW3Y9N/aZJYPByRqYP
         a3+zRoAa8eI4eKkcQ4w9M/v14gVRJwqUz0NGmwLTWrx4H35rcVeA95Mk87CQwGHL4aKX
         mu9wG91a90D5n4RWu5U8l8vOqVd0X/fIGM4e+a5hD3Fp4fcYANX7AfS6xdAKqdehtgcp
         gQ0sQn39YZ9C7Jif0/KvPjaFTka4J8V+MqJVupyds3LtvU//DhpG01gwnR2t0z9w5clP
         gv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791426534; x=1792031334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cLLDCAsceokNY+xwokpVffSC3XQbfRGpIBX8r0xpvd8=;
        b=uNGSBEJi4HzCWbdUAmzhRFLOVEMXVrD0/0QpeQxge3Ku1wfytXkic+ahyEWoFvuUfc
         qMtA+UNb1nmxofUvBPnL2kdZ4tRKUilwzjF98ZB7PwbT4ah4+iYR3kUwvMmZ79ePUaGe
         9ayp8A8Dieisl7AW3Jc1q6115C6NW8bsKTZ0mmt+femoacOj0AJ252CvklpAuAS9jy83
         sACOE+QsfyXzqCFYW3/OX4iLBm28t54ireftG2knaoj7y6MtI4oPv9/DxTLRQ1ItoM9W
         HUDjdM6B3uPddprSwv5wMt9ta1z+swM8bysB7gMqSdeESp602+LinhkumUjbFD6Qh9dn
         Gn4A==
X-Forwarded-Encrypted: i=1; AKwUvByMoAkjMizZDYUj2p+/ajoAZVaGRluK8V+n3RpapH0MnhYAgaVKx5LbTe1uBVu8lKrBuaTbCAcpb44yfMA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWsSMT0PIZ5N6toAp4BmGe7JzxHbZy4oHYItqbpSWBlHJo0pHn
	bhCi00XNpkaSqh87zWxcToFTH9YmvZHYgDlEWAGYoE9JK6Zfpm8nMso2
X-Gm-Gg: AYBFou1H6NYzl/XgBxNKHUfnQdukHfR0DA0m+ceaLih6pzxhFnX7Cjir0ecdQpKpboG
	ZV/JlelyyRe121DASC32UyH5DjJbxQvG6OrOC+x4D0+ndQNa4qpa3ZHFqWkVb1uWr3HpcQ+72xy
	oC6QReLMsrxIZD4lScaEb2c7C8yEArZS/Xoxd+3FJ0lKvn4/8zIuJ27AZONDe3jN+4Dlk1+MkMC
	WKL2SdEKfwQYjoa/k6BIucGEjeNEOUazOzcuWdTvioZ6m+kLQycXEtaHIgt/ZbjbsVbPNJRodP9
	hdFgnyy2IX94RfQ2baCDFLPrYm8HY2A6YlNhcN8P67gDE402l9/XUNdCZl7bfaYLrkAV/8G2PNC
	XJ86RAyz9MCzfwD9ApCVIOkg4uBPpP4+DoO5nPxMJIalueS1/8+o5Y7De1Q5YXyazMhO6uXY4BB
	bgJPA8/RY0gX0Bjk2l5wgEEG6tBVmXhiGNFY5Gu9UYjYt/NehVFWiT9HP93YkKHIp5TP6VSjTn9
	X4gX8CHfjWUB/tLrKVafuZEVQ==
X-Received: by 2002:a17:903:2b0e:b0:2e8:1361:e50c with SMTP id d9443c01a7336-2e81361e68bmr3508025ad.4.1791426534123;
        Wed, 07 Oct 2026 19:28:54 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482cab0sm18045865ad.50.2026.10.07.19.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 19:28:53 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Jacob Keller <jacob.e.keller@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 03/10] net: ethernet: actions: Move setting of netops to fix crash
Date: Thu,  8 Oct 2026 10:26:45 +0800
Message-ID: <20261008022656.3592191-4-mmyangfl@gmail.com>
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

owl_emac_probe() calls owl_emac_phy_init(), which connects the PHY,
before netdev->netdev_ops is assigned. phy_attach_direct() ->
phy_link_topo_add_phy() reads dev->netdev_ops through
netdev_need_ops_lock() since the commit in question, so probing crashes
with a NULL pointer dereference when CONFIG_NET_SHAPER is enabled.

Assign netdev_ops before the PHY attach, as was done for emac in commit
7c9f391ec89c ("net: emac: move setting of netops to fix crash").

Fixes: ded86da4bbb7 ("net: ethtool: relax ethnl_req_get_phydev() locking assertion")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/actions/owl-emac.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/actions/owl-emac.c b/drivers/net/ethernet/actions/owl-emac.c
index 0a08da799255..2538275a1e57 100644
--- a/drivers/net/ethernet/actions/owl-emac.c
+++ b/drivers/net/ethernet/actions/owl-emac.c
@@ -1552,6 +1552,8 @@ static int owl_emac_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	netdev->netdev_ops = &owl_emac_netdev_ops;
+
 	ret = owl_emac_phy_init(netdev);
 	if (ret) {
 		dev_err(dev, "failed to initialize PHY\n");
@@ -1563,7 +1565,6 @@ static int owl_emac_probe(struct platform_device *pdev)
 	netdev->min_mtu = OWL_EMAC_MTU_MIN;
 	netdev->max_mtu = OWL_EMAC_MTU_MAX;
 	netdev->watchdog_timeo = OWL_EMAC_TX_TIMEOUT;
-	netdev->netdev_ops = &owl_emac_netdev_ops;
 	netdev->ethtool_ops = &owl_emac_ethtool_ops;
 	netif_napi_add(netdev, &priv->napi, owl_emac_poll);
 
-- 
2.53.0

