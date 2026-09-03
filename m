Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6772042E420
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788420811; cv=none; b=cd/HXRxnegAJiJ0d2O/2yS0G6zmgMBHmAN5Sc2A6w0kpyx/KMwJlSddj7W+AnGA7OYiIZ1Oqf4oRreP8c5Hz5+nwMNl8mm9b0144EGJo+VyfEAxwj/dwnDJcQb06fvv2OThZ+UMzCut72rUC7g+Am8aMaP5ljbl8gKkpRBiT78w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788420811; c=relaxed/simple;
	bh=SxCqMQ1VszqUJeekaQolW6aWNJXO7nxoW20LyVldySE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BCG+n20Mv1L4Cv8K39/qfDj1VJF3Zt2abBe/29YxhnHrnEfs2VsfN0gz5M5cwbCuZWkZzV2jRAe2QxBBn7hgw3XqC2pbnY6DIeYDadyYK61L2n/Dl5cjxpeEbcqaB/yrlIyExtPwjeBCkJJW2IGAUjNC63AVRYzReF8aNrxu3ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gPHVM6eb; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gPHVM6eb"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso1368576a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788420810; x=1789025610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKLZ7u7XD6WW9l0yLksAVTtKwOMeF0VaxB2QRfd1xRs=;
        b=gPHVM6ebL2+6FZR/y16bLYbUirCgKk/Tb4VAJPZE8E+n7Pmg/KNS/Opn5P30k/nNDs
         vzNtdFmv/NVC2Ny2/uW/xXJq/U01KRWDt6/ZFu6ZoClR7hnkqnj5YHyjjCqu1DcFAH15
         slr5z0pQLgbimmp8MZ7Dugu07+HiPftmU2N7zW3vGi3Hr20pa9h0OXIhbkXhmYeNAJmw
         oTBng2vTTTr49GTsaSnr1j1TLVG9LUSpVes62ufLBs00Jg4B4pIdHHm2pEuu83BgRH9j
         +uXexShkIaHgacu9Rcwc6fWB9OGBJ8OV/hAo3EM8dDeJpWMWHkLb5ROii5lW6yGfM9pV
         Qpsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788420810; x=1789025610;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vKLZ7u7XD6WW9l0yLksAVTtKwOMeF0VaxB2QRfd1xRs=;
        b=k4QwPY9P1UxUdMyOQh4bVgCvT+080PbvKKq6xmz/QJP6HDUwuP1QS9zM56KdvqiS8t
         ufmDwXK9fU4fBoRqWbrKYAcoVx1x0b/+vsLVVR+/CjHmys4zbHp3txVBDe9sYn3C672G
         XzL3mvc5BSO0nZpgWtpNZjZ+i/vjA0ADoVZz1RwIDqomWcsHEtCuH0SlfcmohmyDqeeU
         AnTeriWGuy1prvQYD4pc3UAUFVeutCQ5uMwYQjHCpy/yx9/IQHDTNtsyKoRbdlA7q4NT
         V93ySIHY6UTofevKSdjWy+R7085jGpmOXQN0Zqcflnum0knBLtCsy/QgTHdbh0Vf5AxP
         J4Dw==
X-Forwarded-Encrypted: i=1; AKwUvBz2tekdwb1USSqrZ9AdoPWzejcQvARDBZZg/uDDuMTYdri9JWKKHUMVnbYZswdeTerMhwVIc5mtlrw1GJI=@vger.kernel.org
X-Gm-Message-State: AFuF++kiA2Dq9bWRWm1OTZikdP+qcN2cQDsC0vGhDhaP56er/ZRqpPYG
	WurwLMSPjBq/gBtM9j5DSbisz4dz/dsxIQlxDegJyQ7uu9LvYOyQcBmK
X-Gm-Gg: AYBFou2vTjl0gT5ZZoK2RrOC/JmXhV4dfx/yDEbRdetZQkPXGfp2a7ARb5o8BU3dnek
	JiiPkfEfvvU3kRe6XiTzfK6Z5sgEFAB9AMS+An6/MtrcRBXqy2td5zz+kVlqHKn3U2bN7M17GQS
	aF2BaaDml8NK2tUpdNsOXXk8yAkHXBXcVxkjmwdj7xvZ5G7VQ5JnhYYSh/Mp4vNXRNu0AbCYyNG
	rPBWfT1pdUpsudbLlEFi+ZquVX59nzgwG6pbJP8m4xdXCPC4O1Q26meOmE3bD2P5j2RoEUz3E8Q
	bz+yObMTAZ54AFSdoMFxLe2kSU1KB+ABhvMan/Js6uIjJ/MLR3Qf4svBqRPsBClYWN2VYeQoIog
	lKR0DOBvg863K+aYjEzlRppCGFvLWHEP9pAwebe7ZwFew6BNdvZcBcO4SgMNpPmQsdt8JlIAkaj
	SFLOFD0IfNZ4FZ+iKHBs5zWjbpWaw2GteejO1ArBuqlPas+KllzKhl4j8HRXfNxvScPxIt2AH1x
	tF92DVam4jpFk1dSBlQ/juATb2Ex3srjA05ucqROwAdLZnY+pOmUHenMcVyE1p3Oq6jb83jSmW5
	E/gjGnGV+GEBl802vixYOs1eAeA=
X-Received: by 2002:a17:90b:5828:b0:38e:2e86:ed02 with SMTP id 98e67ed59e1d1-39aee0850bcmr16177711a91.14.1788420809671;
        Thu, 03 Sep 2026 00:33:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08624f11sm3606813a91.11.2026.09.03.00.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 00:33:29 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Simon Horman <horms@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Robert Hancock <hancock@sedsystems.ca>,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v5 3/3] net: xilinx: axienet: Fix IRQ error handling
Date: Thu,  3 Sep 2026 14:32:52 +0700
Message-ID: <20260903073252.339250-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903073252.339250-1-phucduc.bui@gmail.com>
References: <20260903073252.339250-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

irq_of_parse_and_map() returns 0 when parsing or mapping an IRQ fails,
while platform_get_irq() returns a negative error code on failure.

Handle both failure cases appropriately: return -EINVAL when
irq_of_parse_and_map() fails, and propagate the original error code
returned by platform_get_irq() instead of returning -ENOMEM.

Fixes: 28ef9ebdb64c ("net: axienet: make use of axistream-connected attribute optional")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4 : 
 - Add error handling for irq_of_parse_and_map()
Changes in v5 : 
 - Change the error code returned when irq_of_parse_and_map() fails 
   from -ENOMEM to -EINVAL.

 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 3927ababf833..782f903d318f 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -2971,10 +2971,14 @@ static int axienet_probe(struct platform_device *pdev)
 			dev_err(&pdev->dev, "could not map DMA regs\n");
 			return PTR_ERR(lp->dma_regs);
 		}
-		if (lp->rx_irq <= 0 || lp->tx_irq <= 0) {
+		if (!lp->rx_irq || !lp->tx_irq) {
 			dev_err(&pdev->dev, "could not determine irqs\n");
-			return -ENOMEM;
+			return -EINVAL;
 		}
+		if (lp->rx_irq < 0)
+			return lp->rx_irq;
+		if (lp->tx_irq < 0)
+			return lp->tx_irq;
 		if (lp->eth_irq < 0 && lp->eth_irq != -ENXIO)
 			return lp->eth_irq;
 
-- 
2.43.0

