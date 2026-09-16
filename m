Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC5B3C819E
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 05:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789537733; cv=none; b=a+aGUUidVI8W5A6XXLm/3z6Pr+sw3CFfaBVyIw7KbIL8aWD5IkcJS5GWdwtNw3LQs4t/wV3eH3PZW8h+VXTT8Oc8UXCAj7EPVZQ4jwwMecKFNAgugf/YChmWJSb4cEiKnoNIwgf/4z0xOqIt/LytANM9otr1QupA1vpbQNRNTlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789537733; c=relaxed/simple;
	bh=94nvxhOshxi6ufqrH6q/eu2eWcit7hP31npYKzDwW8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JKnfpl8bGC6MHJwCAWsTL1AE/W3T31OxnmTvIf135/+vNR1S9B0MDwefIhK8I5CLCRWVdGx3A20SJUtN1qeypD+BsNtBaZ//g1zWVNNNXgI9LjguQMiy/BpmHexqWnnRA8T8nMbgXmryTXeiIbp+YA1vIn21XfkryR3BMrSkDiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ar95APX2; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ar95APX2"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so136687a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 22:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789537731; x=1790142531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ygYLSmyhlt34Q/MQJdhd0/XySuEC8UfGpdbWkhO4AAw=;
        b=Ar95APX29F+IVRPFYanadFUuihZ/nv1mYpYiqon6PaXZ56+1C2/ZmXKCCo95M6URNF
         QvBFBu83bpMrEUgIzduQ1dfNW+f3eQtv5XBmEfZXK5vieHjQqgaGViZDa28+LhtWL7Wh
         yJNbk4/FarrwB78kHgNiiOsE1cB+u9g6jPHClW7+33A01N1/F0JGrjUDrl//BR7TEdbK
         H7vieXiqE8IHyC3/0d29K2ZRLezPY+7lvLOur2ogBe3yawWa7/1yf0fHRHVsOrqt7sv/
         Se6iovtdyfHS9pMX4FildGV20T9kNZ9Qqaz6b2XwMOahb7UoXN1NsUXcmfNraxAht2kM
         4vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789537731; x=1790142531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ygYLSmyhlt34Q/MQJdhd0/XySuEC8UfGpdbWkhO4AAw=;
        b=MMQomJxmEc0Co0Na/+WtXklnmFbpkk1beGKkWHIO65UwqwSm58gWOSsxkQ6/NZtrCz
         TKx1uPgF0LCf66QN6WJmgFbQ2NTZqOAl4JrIXOfpFsQcE9lU0GpHzb9vA0ZRxYY0nexZ
         87nveW90Pfib0Ev58O7k1swBfyiuK1j5Y8XCrgH8JHMEJMskbmmBuMkjZ/GhttoO46Hz
         zLOsDqL9gmeNiVsJ0npJDQ3RxxLoz8NPsxM4HWrRh/zJVZ7kQgYpDo+KOUT2rfYmm2Us
         YDt76tXPIyYP7SoOfGfBUqNKtB4JNhgn9jZqHz8iC/2TKHbqNgYAXnahooZ3+LQG9h2o
         LbcQ==
X-Forwarded-Encrypted: i=1; AKwUvBz57P71oXKel0vRvvYTUmHoYAlawaUI52hpfspVwYQiWMKvVgXdgv7z5oiZr5sjE0sJBJqZtFdUDmvRQeg=@vger.kernel.org
X-Gm-Message-State: AFuF++mbOHLdQtn07qry9v/6AIG2IoRIoMTW5Q5d7L6ZR28JzF/UaUcX
	A8SqQqwhJeLpJTJzmJ89HMpDBvFvD2Q4BzNxwmCEEbXhjq1aDlue/7Fc
X-Gm-Gg: AYBFou30aGAY/V+6gP7htl3HQA+NbWABs5OGKqcpQ9T2hXZz9/kKF0Tu9w1r7I91IZE
	Mtj7Vjo/VQ/hNt6sNHh4aDCrk5Y7JL1z4Ik1ihQwpFAiXR4rzVybElk0UKg7BaZGXZCtwcrIIBI
	6yrSn6WAT2mVILqRPsgcFgKjYmq1SeeHJSI4ueV/NuJWTqC6b5DZRuS6KB7jybf4x58X3C5/o3j
	dgT7r3/k4Q0kxlhBOVk8Fc7clYzcv/fMwCPnyjvzUJ3IbB6HkSlqMjqy7AK2LcMiSG/did+SPeG
	hN39uWkgUFVxs+GZoKFQusKkslyGj9/62SZ2i+cNamcs9SMqS0q8YYaoegqYeGCeEsrYMZrFPaE
	1uEKO5b0VOuQcawNh3Z6w2nEhXBAkJuNGgmewX+CdacjFSNrUrWgCddL3JzjsiV/I6sjPGYhCtA
	nWklFDK/JTEY6UItp/xxes/7nvxakByZ6tE9M9TkyxK4AsYFaKik1cwg==
X-Received: by 2002:a17:90b:55c6:b0:39e:238a:be0a with SMTP id 98e67ed59e1d1-39e238ac14bmr758249a91.16.1789537731220;
        Tue, 15 Sep 2026 22:48:51 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b712ea3sm2659622a91.9.2026.09.15.22.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 22:48:50 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Byungho An <bh74.an@samsung.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Siva Reddy <siva.kallam@samsung.com>,
	Vipul Pandya <vipul.pandya@samsung.com>,
	Girish K S <ks.giri@samsung.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] net: sxgbe: dispose IRQ mappings on device removal
Date: Wed, 16 Sep 2026 13:48:41 +0800
Message-ID: <20260916054841.2908429-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sxgbe_platform_probe() creates interrupt mappings for the common,
TX, RX and LPI interrupts with irq_of_parse_and_map().

The probe failure path disposes the common, TX and RX mappings with
irq_dispose_mapping(). However, after a successful probe, the mappings
are never disposed when the device is removed.

Register a devres action for each IRQ mapping immediately after it is
created. This also guarantees that devres-managed IRQ handlers are
released before their mappings are disposed.

This issue was found by manual code inspection.

Fixes: 1edb9ca69e8a ("net: sxgbe: add basic framework for Samsung 10Gb ethernet driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 .../ethernet/samsung/sxgbe/sxgbe_platform.c   | 41 +++++++++++++------
 1 file changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c b/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
index e4701b29e1a0..cd8d39a1afff 100644
--- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
+++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
@@ -67,6 +67,13 @@ static int sxgbe_probe_config_dt(struct platform_device *pdev,
 }
 #endif /* CONFIG_OF */
 
+static void sxgbe_irq_dispose_mapping(void *data)
+{
+	unsigned int irq = (unsigned int)(unsigned long)data;
+
+	irq_dispose_mapping(irq);
+}
+
 /**
  * sxgbe_platform_probe
  * @pdev: platform device pointer
@@ -116,6 +123,11 @@ static int sxgbe_platform_probe(struct platform_device *pdev)
 		goto err_drv_remove;
 	}
 
+	ret = devm_add_action_or_reset(dev, sxgbe_irq_dispose_mapping,
+				       (void *)(unsigned long)priv->irq);
+	if (ret)
+		goto err_drv_remove;
+
 	/* Get MAC address if available (DT) */
 	of_get_ethdev_address(node, priv->dev);
 
@@ -124,38 +136,43 @@ static int sxgbe_platform_probe(struct platform_device *pdev)
 		priv->txq[i]->irq_no = irq_of_parse_and_map(node, chan++);
 		if (priv->txq[i]->irq_no <= 0) {
 			dev_err(dev, "sxgbe tx irq parsing failed\n");
-			goto err_tx_irq_unmap;
+			goto err_drv_remove;
 		}
+		ret = devm_add_action_or_reset(dev, sxgbe_irq_dispose_mapping,
+					       (void *)(unsigned long)
+					       priv->txq[i]->irq_no);
+		if (ret)
+			goto err_drv_remove;
 	}
 
 	for (i = 0; i < SXGBE_RX_QUEUES; i++) {
 		priv->rxq[i]->irq_no = irq_of_parse_and_map(node, chan++);
 		if (priv->rxq[i]->irq_no <= 0) {
 			dev_err(dev, "sxgbe rx irq parsing failed\n");
-			goto err_rx_irq_unmap;
+			goto err_drv_remove;
 		}
+		ret = devm_add_action_or_reset(dev, sxgbe_irq_dispose_mapping,
+					       (void *)(unsigned long)
+				       priv->rxq[i]->irq_no);
+		if (ret)
+			goto err_drv_remove;
 	}
 
 	priv->lpi_irq = irq_of_parse_and_map(node, chan);
 	if (priv->lpi_irq <= 0) {
 		dev_err(dev, "sxgbe lpi irq parsing failed\n");
-		goto err_rx_irq_unmap;
+		goto err_drv_remove;
 	}
-
+	ret = devm_add_action_or_reset(dev, sxgbe_irq_dispose_mapping,
+				       (void *)(unsigned long)priv->lpi_irq);
+	if (ret)
+		goto err_drv_remove;
 	platform_set_drvdata(pdev, priv->dev);
 
 	pr_debug("platform driver registration completed\n");
 
 	return 0;
 
-err_rx_irq_unmap:
-	while (i--)
-		irq_dispose_mapping(priv->rxq[i]->irq_no);
-	i = SXGBE_TX_QUEUES;
-err_tx_irq_unmap:
-	while (i--)
-		irq_dispose_mapping(priv->txq[i]->irq_no);
-	irq_dispose_mapping(priv->irq);
 err_drv_remove:
 	sxgbe_drv_remove(priv->dev);
 err_out:
-- 
2.43.0

