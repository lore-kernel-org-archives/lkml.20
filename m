Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E982C331202
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 04:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788929725; cv=none; b=Rs3Miu7FGbCvfHAdsR3LedOphM7WszWLYbs5+b/UMvwrkmfzobv3yuZtJaI3dnR6D13Jz4sHjHDQy+APlOO8bJJ8HSsu7VmLSEvgpEWf0hGzVcKaGnxvprrAa6Ufz78kROwI3z/fbkD7y6FZVpw9uhYQJCv8JivptVv2j8yr+ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788929725; c=relaxed/simple;
	bh=UFYz45aWYI+X83+iIz+CMEsv5bGyQep6UXbWxkDJvj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N5zENXJWwFPNRYloVjuR6NBYP7TtoaskEcUkqIx+iaTnln6ESCxlNCP/v5Z9eduzNJ0t6byaOJ2OAwd0g2FFJNUvks9OC8rgw2ghP+MuLPVlplWNpJFoOQY8Lgo9g5XW4J3e90NOto8S5Bo1a/vvV8MoFw3QgtDMW9A441FhmNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsA0cbvm; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsA0cbvm"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f066d8so5893155ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 21:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788929723; x=1789534523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A5IgLCU04RRBc+Gwx3mrSW66CKoAgwZR7YrSzPsHUdM=;
        b=SsA0cbvmcOWwQwxUs4Tenu1awhlG/r64x2O6BaCP5YFwQEkrlszmqlz+4vnIFG5SAj
         NLX+yTstl5JYmsifB0fSB4DbHdp+vaM788GgdJHQ5+QGZfIgFxlhFWTdNyXpvHF2kkJ1
         PWYNGsbsmW8AtMe+jBd7LRyblovaofRvYT8iO5DnJCix8wP5uHnjlSFxYMzX+oLbcamm
         xHBJAgGXLRqQXxuzDkxBa4h5XR2PFy96pzbz04U15u7/3QjvrI2nQCNsX2oEEmdbd2/i
         XBZbM9MCUwMxRhbRdKzDXJdsZfplQ+FBXHldEqNKBYh2SnZxCd7EVuPedUOKcCQvFCfx
         Dzxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788929723; x=1789534523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=A5IgLCU04RRBc+Gwx3mrSW66CKoAgwZR7YrSzPsHUdM=;
        b=A0xrqYYIVBd1BZWRScs+D1OG0YRLuepB7Wy58YkFLkYSDzH/jPCtvQKdXTrcUjqsUJ
         n3MI0gtbL1Oq6GXeBBIj6yIYk7xmQBFem6YQMLRoDsp4upl1IyOnb88TDDuCX3uAECRo
         wgyau3NUDVen8hAkpJeXZpwAKVJWAzPeovvYQWR8lDVWzU6oE3QluWyoJlImH82txSE3
         Wu/dVe288RoKmCGsHk1b4lsh5JctonF/ax/7PIXExky2zKMFuhGMbkedpKekmac1CNgg
         ajViLLNqijlHFybHY+PWz8Gu8UuFQGKqmHdEo4MoXB4E3N/T4QqL6nhGUPdGsF63eaij
         5UDA==
X-Forwarded-Encrypted: i=1; AKwUvBz2FyEvQ+D7qIlC5hmoKLoLqDWtcSIv4nr1anSS7kpPQoal70PMKquNcNorzNMW2D39HQ9bjR6R6chx6GI=@vger.kernel.org
X-Gm-Message-State: AFuF++kDjmwt2n/OeUejRW8Kty/UlzMjxvUkIdN4nh4AUwVLgL3MgvgM
	Ohnl+jkYbGAJ/Ay7++Nl+ArDCAmRcS/OLjKx1EmyyNi8L/K47SWbYCrT
X-Gm-Gg: AYBFou0bi3hd2rkoaYB2GLP5P2Bmor4QGTHBG6sq3Gk/faV2RMjhNjJcEXdd5rHUhIw
	eqlWSnL8G4l8mA+0NPY9J4Lc2FfJ4EIv2PUcFeHL+3LGK2K/ykrRzR4Wg2AnV9/ylGFQ6c+V6MD
	1hLDmPRDG0KtBW3y6BUNgaYrruS2ssQZAAEax2DvYbAG4Kg7eAdJHjtPLOmcPPJeBSAz86sT1iQ
	TmO7ghunPQhSZSnTLJs3Dn1oEAnusCw9Ddm/WOb+G1eXURB6vrRB/rLUEawgVVuE6CgaUL+AsBq
	TkQS424G7MUgBUXpOinpc9Cmk/hR24kefbn0SbqTa+O/+yiqyFHWscWJFuKQ/RfTtji7W7irKNd
	04wCyv8gceLt8FInQ4U/y4K0VPpMxN2BwTmg5ZRMGYii5kNNCN0Ug6pgMKpH2ZWqvzlmOUdYGD+
	EkjlFokobScIxOrP57FttwjCZElw+In+jR/0XygzIy8TB7hkjFohrxgohBVo0GDDanpZv/eMijU
	7QIHJFP1yKDv5aKrm62/pGVqHoWm/fhL6vjQVnxJ1D8kyzRC/SzYaZO6NRz+QeKYi/t1kOBfcgY
	+kJVmqXz0XC+5xIbKdnLiD9Cdg==
X-Received: by 2002:a17:903:40d1:b0:2ca:12aa:a390 with SMTP id d9443c01a7336-2db6f91506dmr96058075ad.0.1788929723024;
        Tue, 08 Sep 2026 21:55:23 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1499e876sm66688505ad.56.2026.09.08.21.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 21:55:22 -0700 (PDT)
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
Subject: [PATCH net-next v6 3/3] net: xilinx: axienet: Fix IRQ error handling
Date: Wed,  9 Sep 2026 11:54:50 +0700
Message-ID: <20260909045450.16176-4-phucduc.bui@gmail.com>
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

irq_of_parse_and_map() returns 0 when parsing or mapping an IRQ fails,
while platform_get_irq() returns a negative error code on failure.

Handle both failure cases appropriately: return -EINVAL when
irq_of_parse_and_map() fails, and propagate the original error code
returned by platform_get_irq() instead of returning -ENOMEM.

Reviewed-by: Simon Horman <horms@kernel.org>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v4 : 
 - Add error handling for irq_of_parse_and_map()
Changes in v5 : 
 - Change the error code returned when irq_of_parse_and_map() fails 
   from -ENOMEM to -EINVAL.
Changes in v6 : 
 - Add Simon's Reviewed-by: tag.
 - Drop the Fixes: tag as this patch is intended for net-next.

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

