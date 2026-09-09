Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39E335FF6C
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788929719; cv=none; b=X7zxOSXW8e+6YGtVtUnG2LignqsVQZi8OHHsVEOIH1zPShjj8dYRgCIlCceY4n+0W27F+vxTmC2+ZxFs1MDoYNLmrR7dEiWAaguBn2ZwMZmL040SlO3sTiNO/xOTD8vIsDn73bMO3Az9Rm3ibHnEK2PKXWJOBqFVz9KCYJ+xpJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788929719; c=relaxed/simple;
	bh=9XQNM3dHn9B6ebcmsmXP5Kg8HA2I6Ns/3HUBA3vfo5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mru7fPS94TRxaXEcX7en4AodcDNiEbL1VfCK3kucYKToyTaeKvwGRZC/CjlDA1+nBX2wuSs3iYeTueEE29jrdkb1Y6NKcBT7eIoh6qP6+p3bU+j03KUsXr+dMpOUbjABN4Mz4eQLFOotqk+fqmhGqpZdkMwPtuQTBu7+FK5RN7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6kcDLnt; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6kcDLnt"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d032846c95so63355995ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 21:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788929717; x=1789534517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qiAYhnnhs61WtKZMJIh7R7XvaVkzgplipEpTD594EKI=;
        b=M6kcDLnt6lHDVasxDqZm9/IxYakPr0pHZB/5UNRYvE5YT9ka0+URz235GSBlTAqFZL
         23PSr8U2ppXLVVRnBt3Aps+eZzn3Qfq5tsFGFM5xFw85PbaFWc178y4xhv0n3KWIc223
         T3CZfXfw66QttQmBYie4sHG/Xjr1GWmZfsO5iUf8Hgi1INMoN94pLmm38RIGk+WUaBoM
         Xk0d442oI+Q2PPKWEv1hcXj+clh4OYXVAFaXR9D0n+yqHcdmmO+F8bD0qqiDD9f/5eO9
         Zi1dPK8AhhLiWJ0Uvg9l1eBMiuW+1NjVujBrHprUgQVzge4pRUaiDV/fjB3663HYEsyb
         upYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788929717; x=1789534517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qiAYhnnhs61WtKZMJIh7R7XvaVkzgplipEpTD594EKI=;
        b=o1wBy+GXWXnPPdznn9dzN3k+DHC8kz+D8nz1HIeffL1GCR2q16dIzvvb77BADw7CA+
         XRAuR4LsQM5UBT5IqLCAT5eRTsnb8DKNRNq3YWRstXgNTnNfA9m92aUUUKQ4LLebYin4
         zSB1bjnpZmW2LEYyDtYkezgQavn/g3SDlHkQuyxp68vBj095QYokkSS93XppEFvy3oKd
         DcAx7d7xRgTaaN1BWWDaZarRB5efwZxcB6XK2h7bMAx0UszK4mtOAu/FSlqLuWDkdo8I
         6wxWXys0Wsa+7uS8dfycoY7/OAIw7X8FldqL2magAjPiQJ/ONKOtn2Wa4BjA+WzvKmkJ
         xrEw==
X-Forwarded-Encrypted: i=1; AKwUvBxox+yQEehQfgh3w2HL+mKpRUIQ1iNBSjaTAg0xuJNPgsivupPC1dpxcpOREIi7dvdY8f5z8cOLLupkd4I=@vger.kernel.org
X-Gm-Message-State: AFuF++lbY8lUSDY22DYTEvg3VECTgLeY7T20tvvxypGL5AHrRamaeMIL
	6Qu93TjCDncI1Bfz2JbgnxlXOAWbE8GC+BUqH9euaBnBzTS8sQPvnNAc
X-Gm-Gg: AYBFou0Sl+1iBJIh1lxfAX/vDpElH1BGR836XAlphv0m/zW9MERSH7gP5yPCyT1OKyl
	SQTAJJj4pYQQObi5Hk7Vx7LPkbr6Kcx+Yj4zMiZdmfXA4tmSth0Ex6yLFuceQCypzDFP8caD+OY
	6yvJu/ZnVFETFdJV961ZXyJp6tKzZF7zkbJg9aOTtLIYap/SsDY1FiXNnwRGSHzlT3wFfVI8vAZ
	aOzYnMpT18/IiiRAm8LyZht8vZhqz3eiNdqrfMEkoTdpkE8Z9xX9zHsfcPbESZndlWAz+Zu1FA6
	R38exSCBzLzm1JcAJj2AiCE0H7moGdW748jf8niz+d12Klq/RLv0eNXHMM4qaJuxWKvnn6U9h3C
	4r4IiZoTEkxaIpXWmhIZOTejyW7K8ZHWuJcKpbO5uik6oUPqewbHLPD+GS/IzLLltOk4tX7td2B
	cUiN1dlFORsnqfhJb4yTH37iRcnt2dNWHGBL8PraDrDAvHOlQ83pQIn+2WugnY86WdvkahgBfSF
	4oKb8zxod36ZE7sqZ2UVthptgnzgFpviwMZwsKfjxLwd5klVvT32mfbk7rR04LJyn7UqlOdah5z
	Y/MdN08uaD3QdBvE
X-Received: by 2002:a17:903:32cb:b0:2c9:bf82:dd11 with SMTP id d9443c01a7336-2db1248c3f4mr422794085ad.7.1788929716983;
        Tue, 08 Sep 2026 21:55:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1499e876sm66688505ad.56.2026.09.08.21.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 21:55:16 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>,
	Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v6 2/3] net: xilinx: axienet: Handle optional IRQ return value correctly
Date: Wed,  9 Sep 2026 11:54:49 +0700
Message-ID: <20260909045450.16176-3-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909045450.16176-1-phucduc.bui@gmail.com>
References: <20260909045450.16176-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

lp->eth_irq is assigned from platform_get_irq_optional(), which returns
a non-zero interrupt number on success or a negative error number on
failure. Errors other than -ENXIO are handled before this check,
so -ENXIO is the only error value that can reach this point.

Check for a negative value instead of treating 0 as an undefined IRQ.

Reviewed-by: Simon Horman <horms@kernel.org>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v6 : 
 - Add Simon's Reviewed-by: tag.
 - Drop the Fixes: tag as this patch is intended for net-next.

 drivers/net/ethernet/xilinx/xilinx_axienet_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 207aecb5f8b9..3927ababf833 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -3052,7 +3052,7 @@ static int axienet_probe(struct platform_device *pdev)
 		ndev->ethtool_ops = &axienet_ethtool_ops;
 	}
 	/* Check for Ethernet core IRQ (optional) */
-	if (lp->eth_irq <= 0)
+	if (lp->eth_irq < 0)
 		dev_info(&pdev->dev, "Ethernet core IRQ not defined\n");
 
 	/* Retrieve the MAC address */
-- 
2.43.0

