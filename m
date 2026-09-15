Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F9C42378F
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 17:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789492924; cv=none; b=Y+rXe7HkXOguBeBGZ8Vj4ippbZIkKMyPDC4dpREIeJpdJzHrimKGbeVxPx8qwk3bSljyWSbehn7atO+xgQI/1dvaUPz3nWcKWQpgObdeYIJTirc1HXtXAU9ajlbIAyIKSpbP7Pz7UZPEXLTCo2Jc+GD4xR4UN5mPDGmwLP09V7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789492924; c=relaxed/simple;
	bh=n5nQfesIhDoEpdn12rZpUX9ykWYK40jhHplwawvZ/D4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X5w6VbLlyVrE1RFDw/KJEqPHb3hsu9zK9gEbW9EYWawN72I6uyo4rpTXcARSAQfNpspIYEl/crlVlON5fVozC4k85BrXJFmef5zNfsJOvCWrZmsLwM/pvjeavqm5eyThlEmCBsCZ9N3Kq11c9/+Xnw7V5yaJhYCxTvdFpPCTuik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U01cnRxG; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U01cnRxG"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc1cea50db3so23466a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789492922; x=1790097722; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yF6h3RStIa2aUCRcCvGNobGgDUeR4bbMcNYID0OzPtY=;
        b=U01cnRxGfz4fRpWK+z2e6M8PhrRO/prGWWkIWcQVOjRZMizJmxLcqxrMIp3irk125l
         B7uEXsq5VnOH+2R5aE7nI2ZIt35p6pDnH+nu86hnzHfBuYXx7s1mVAIbnwFCaRtljER8
         TgOYaVkKatMTFkuMynStkBwrU6SrmqvgUaEStAv4gI9bzRHP+72tjFe169vws8Q1VVf0
         kEQrmFXv6flvrllY9Su0/RhqpxViLDapoOM86E1dtDk+KK9QMUQLo2DZVT7d1HHLpAjj
         o6kFjF/TIsHEruW7MkffIlrDdZJf4ZuHPshBS7YTcIahtvm+NBFbmA9sa6FmMPOTCcZf
         JgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789492922; x=1790097722;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yF6h3RStIa2aUCRcCvGNobGgDUeR4bbMcNYID0OzPtY=;
        b=cNrEIXxHzS0FBaxPSso9xUzqr0pRfSWbAE3uYNI9q4xIRo3Ws67ILHun2ekU3Bsm4C
         5NZhLv+HMMfpE3byc5g1M6NDmxWe8PCWjn9QkN+Dejs4LNT8gq0nqpvWAKJBd8diOIL+
         eoO620T2/lJYNpLAwLKdHYPYOSNa5rgFm/BW0fqudH6BpVjq0pJ92hP/tSLqREfzm5Xa
         rbRyar9iqM5o8oJ9tZtaj87HtuC+il5O8WXWoW2uxE2356L+Te1BvyAz9ToqBITYKrgb
         x6I4wCk0sMOisWv5oBZqYYLdZq/jcLZ688qVNAvOewrnyoDzr0K5r16sbB0sO6L1wxXv
         xNyA==
X-Forwarded-Encrypted: i=1; AKwUvBwxDUWlSIHAf/eFBWd5rU6zYunzQcicEyXee9LNKT7cT0kQDMiNRWTFt3GfVV3YJZiVh3wMDwMc01CMthM=@vger.kernel.org
X-Gm-Message-State: AFuF++nq9O3od/AKq9Uz7Eh3+doCXBv+7nVtkkOIoGVdCHPUQQfvhQta
	CXInH71w+aaPJCtt/zyspbhFK5G5p1S4TU9WoXi0gy9GKDwWYcAX3TnB
X-Gm-Gg: AYBFou21QczsaVunS4Y9A4/ogDYWVpHlNvxVmPmrHQSLVADtMoWhwt0RI80kOn+aDRw
	3OjnvJHmV4td4sgZ77TgB0juCbod9c/eTIRMw0e6vSl4TlvyZQDl9rXcIFgSLGQDABrfDw9iVcM
	GjV3lS/wwknurBjGqM3DEJhFuRojrLKDHCIKubfWjZwl0FLvoIFj01mYa5FUMlgK1qsxMl6ar5p
	HzPMc4GuX2o/skSoyZLb0tVM4hhYxtZJu3cdd1K5/lWP+xwY+ZfsQrge7BVmOu3CKStdTCd+grk
	qT+lYQBK1SKubm5Nr71V/IlZSqLzV+dn4QQ22MF4YqjOKT+AqbUoh+vHTbr/EGnVS2y8mgvoi09
	pWvDf6Ck8tHSebKeBHyBXIx0HGYyeu/JAFwj8rj1bWlUdY8zTzRcwKfAzL1uodEYzLNiMZlUl/p
	JFvNuPJlpMKtla/7gozBgarbIGqKworgFANxlxQLiiuhSeWbZU0iFRGg==
X-Received: by 2002:a17:90b:17c3:b0:39d:eda9:fac2 with SMTP id 98e67ed59e1d1-39dedaa0e10mr15065469a91.18.1789492922160;
        Tue, 15 Sep 2026 10:22:02 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdcb618bsm6349910a91.5.2026.09.15.10.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 10:22:01 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>,
	Vincent Mailhol <mailhol@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Per Dalen <per.dalen@cnw.se>,
	Wolfgang Grandegger <wg@grandegger.com>,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] can: sja1000: kvaser_pci: fix duplicate PCI I/O unmapping
Date: Wed, 16 Sep 2026 01:21:51 +0800
Message-ID: <20260915172151.2507365-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kvaser_pci_init_one() maps the PCI I/O regions with pci_iomap(), while
kvaser_pci_del_chan() also unmaps the same mappings as part of channel
cleanup.

If kvaser_pci_add_chan() fails after the master device has been
initialized, the probe error path calls kvaser_pci_del_chan(), which
unmaps the PCI I/O regions, and then falls through to failure_iounmap,
where the same mappings are unmapped again.

Move the PCI I/O unmapping out of kvaser_pci_del_chan(). Let the probe
error path release the mappings through failure_iounmap and explicitly
release them in kvaser_pci_remove_one() after channel cleanup. This
ensures that each PCI I/O mapping is released exactly once.

This issue was found by manual code inspection.

Fixes: 3878fb6fdbce ("The patch adds support for the PCI cards: PCIcan and PCIcanx (1, 2 or 4 channel) from Kvaser (http://www.kvaser.com).")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/net/can/sja1000/kvaser_pci.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/net/can/sja1000/kvaser_pci.c b/drivers/net/can/sja1000/kvaser_pci.c
index 95fe9ee1ce32..b21ca65d2daa 100644
--- a/drivers/net/can/sja1000/kvaser_pci.c
+++ b/drivers/net/can/sja1000/kvaser_pci.c
@@ -186,10 +186,6 @@ static void kvaser_pci_del_chan(struct net_device *dev)
 	}
 	unregister_sja1000dev(dev);
 
-	pci_iounmap(board->pci_dev, priv->reg_base);
-	pci_iounmap(board->pci_dev, board->conf_addr);
-	pci_iounmap(board->pci_dev, board->res_addr);
-
 	free_sja1000dev(dev);
 }
 
@@ -367,9 +363,18 @@ static int kvaser_pci_init_one(struct pci_dev *pdev,
 static void kvaser_pci_remove_one(struct pci_dev *pdev)
 {
 	struct net_device *dev = pci_get_drvdata(pdev);
+	struct sja1000_priv *priv = netdev_priv(dev);
+	struct kvaser_pci *board = priv->priv;
+	void __iomem *base_addr = priv->reg_base;
+	void __iomem *conf_addr = board->conf_addr;
+	void __iomem *res_addr = board->res_addr;
 
 	kvaser_pci_del_chan(dev);
 
+	pci_iounmap(pdev, conf_addr);
+	pci_iounmap(pdev, res_addr);
+	pci_iounmap(pdev, base_addr);
+
 	pci_release_regions(pdev);
 	pci_disable_device(pdev);
 }
-- 
2.43.0

