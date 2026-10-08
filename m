Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BFA23A48CA
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791426549; cv=none; b=odgnONUpuITF3k3Rm1du5okgdPg4yIexackQroai1vITlXJXzzCL9i9TQTZnlFLz6/v+Z9VkzgxCOGKoa/NGt/coSQ+kxi9ay/zxC4krwdPA0dk20ZMCs9ZzrGZW0d+jjRTis2CEsID2+beJjCLvzm5YPY3CtkMRq7BsoOg3ouk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791426549; c=relaxed/simple;
	bh=ztKTT4JAcEoax2iY+PtSE7h4q8MRZduhYVOG131ubtQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNutPM/WlTdEYllulKAmCfOpdZhJxJqjp+GTnEVv5BY/dpWkQSWMIfyTv666sWwQY5rbdrf4TkpysvtAKanpyersdNhXXAK8LQc/zQ/kbijNAq1WV4X584FbM1zY7U2piZezjEay3sFHgpudI1Qi6INT84INgIh+SYzVXSbbMac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqdZ3f1/; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqdZ3f1/"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2dfa54c8ccfso1489655ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 19:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791426547; x=1792031347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B0Fg0kvLuqZeUZslFiV+07zDYOZ3aqmA+U8LAhXNczw=;
        b=YqdZ3f1/b+HCq/dj1YqgSfafhI/W3FzU2ifg9w4mrPMJxKFlKF5BmwFW23Ri4i+S+N
         d5E93RwSeiXX3OJ/oFfe5p+goqRRo/iI2UtdzzfU+Wl496hTdKNP1FaLp39av5CbXb9h
         5scq0v2AX+fLSqklxRXKAlnQ74jFUC6+itNSLNEHT4rhorCdfxbYt4MAoQ+HaxT26VDB
         Xllercn59zvgQe4/nA2mXfVsgmWL92tKl8oeiH9JM7REmLFXQuKGftd1SwvFXJartSep
         OER2Ns6KsotXOIZhSF8omXPZAJD+98v0eTC1cF3HY709kGK4xJpKAHMeU74K+3Ys+0tB
         94RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791426547; x=1792031347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=B0Fg0kvLuqZeUZslFiV+07zDYOZ3aqmA+U8LAhXNczw=;
        b=TFDC60MBmp0uLb6hNSHU3954wG+YcMRuZLdwc9prIzEbbZGKtNDv5kCLSP1mao+/U1
         gbrf6bUJy28VOGek/wG9DlfX082I/uUg/dKUaI90C7NViUXnA1NWodYCjBxJ0p9Nm1Da
         iz8RShg+3wbPgCs2Fw0SUl/aazCirRx6P5TvExYD871DNLOz9zbVFzrSBCWI48Vz62c9
         khD3KS0y78bef1xTZC6ahi7psogSEOwqZCCj76xW71k1GgxFJx4P6V1lcKuSRkaeRcR+
         mCGkA1F58OkIt3/Fkx07bmTmUQ8G4NBwkGa/+HIsIzVn6SvhEKNedVaAUAjctuEhY1IR
         EbmA==
X-Forwarded-Encrypted: i=1; AKwUvBzgdUD9EkYTe4L4Pw0PVY+eMQMAL4W+BFgrlKbN/sPzN0cGIcIwTJDQEKNI/5GGkQXGgvy/U1dQiPhOtpM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyjG9828wp/vMRL/GpldJLh9+EDA1YLCKwPhesZ2+89xaBfjM5
	v0GV7FZvO4Ion58c1PxWqKzqLg50DV+bc4mP3SlwiArI2JegfL9AMN+FM+4W5J2K
X-Gm-Gg: AYBFou0GEeAATQPWzsLSYXDW2CcRnBQlCHHb2qH4javlRhaHTxlVzGCrMJInhCyI6Vz
	QywoyW4qUxw97aocWwZ8AE22GWBB+A4x+ZVAEZgh/xjOyqnPvkQKneRDFVhUL2c56MKll8OsjkJ
	/rxB2O73pMPdkek3SlNX3XxhzjVZmFcVvTOv/NGeZy114taisfcRecILYKuibdM2ei7kwB9CsGz
	Sp1GI8sczyV3aGM6gttDaIYjl+vIFP/rSLPMVOysOvexQta0bmGiS1wxk9WLZZR4Q5K51qV0gT6
	3UIq8/sI7D2UNHund7PbGAcgLfvAIo6bfGLJCPHtx/z2BgLIpOq+WudX09zBe6sk0xzbx6H6IPy
	Xqv5luzDA17pZ/lmWrad6E//jypZZEWJTSPb8CfSkQuH9PrzWTLmSFSofT0Wl4ROq8svYSeyvwE
	MQIcJpoSYLltH0Iw55xi681qfX9hfNaU8IDoSwfr2MHsv2x5LVGLGWIKAyipXsqfQQDLw5crkWi
	CDLwNLXZXzZZTWLpymXQUvKaw==
X-Received: by 2002:a17:903:3807:b0:2df:8c4d:a2be with SMTP id d9443c01a7336-2e7ffe981aamr5886625ad.39.1791426547277;
        Wed, 07 Oct 2026 19:29:07 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661c:1246::1d2:d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e60482cab0sm18045865ad.50.2026.10.07.19.29.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 19:29:05 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Simon Horman <horms@kernel.org>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net 06/10] net: au1000: move setting of netops to fix crash
Date: Thu,  8 Oct 2026 10:26:48 +0800
Message-ID: <20261008022656.3592191-7-mmyangfl@gmail.com>
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

au1000_probe() calls au1000_mii_probe(), which connects the PHY,
before dev->netdev_ops is assigned. phy_attach_direct() ->
phy_link_topo_add_phy() reads dev->netdev_ops through
netdev_need_ops_lock() since the commit in question, so probing crashes
with a NULL pointer dereference when CONFIG_NET_SHAPER is enabled.

Assign netdev_ops before the PHY attach, as was done for emac in commit
7c9f391ec89c ("net: emac: move setting of netops to fix crash").

Fixes: ded86da4bbb7 ("net: ethtool: relax ethnl_req_get_phydev() locking assertion")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/ethernet/amd/au1000_eth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
index 5a04056e38fa..8682323d693f 100644
--- a/drivers/net/ethernet/amd/au1000_eth.c
+++ b/drivers/net/ethernet/amd/au1000_eth.c
@@ -1225,6 +1225,8 @@ static int au1000_probe(struct platform_device *pdev)
 		goto err_mdiobus_reg;
 	}
 
+	dev->netdev_ops = &au1000_netdev_ops;
+
 	err = au1000_mii_probe(dev);
 	if (err != 0)
 		goto err_out;
@@ -1263,7 +1265,6 @@ static int au1000_probe(struct platform_device *pdev)
 
 	dev->base_addr = base->start;
 	dev->irq = irq;
-	dev->netdev_ops = &au1000_netdev_ops;
 	dev->ethtool_ops = &au1000_ethtool_ops;
 	dev->watchdog_timeo = ETH_TX_TIMEOUT;
 
-- 
2.53.0

