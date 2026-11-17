Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926620;
	b=O8jRa6IV/37lZFdl2x+NF/ovGNIFalRB/rAqUSVVqVHakkQx6VvYq4/5f0vS0WC0Yyup
	 gsC1RpXTOdeMHh/LaK+qPNJNl3b3jTyEPpxJMbG8gawcMpT0/FEn9g73XxY2DCG+J06Ra
	 Nap263BAx6sdzVulUdrmSKC/NC3Z+a1lDIRLSYHcht/4Txleg88dXEBqdFZ4//Np1w8TZ
	 Y6a0HVANSRf4IHXdzQSosmsGmVaNX4bzc1mEaKMsUve9liPwBhqjHbnsrwel69DHhu0YR
	 pq7PQ+1NrNFcJfvfpHvjFu0YmffRayDiYn8oR2UwMRAPgqMddcMgFaiGcTnragpXn6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926620;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:X-HM-Spam-Status:
	 DKIM-Signature;
	bh=UvCn8QYH1wFV9fdIIhLnz86KR/yEzQGClFZbRaOTEFI=;
	b=o79vNIKYTGckcYCQCYutbw0lbH8NqvrWE0TOrjUEpPgl/ylwQIoT52kbyS5CKafLz/ZP
	 o8D6P5REKEn3uo4+kcJ7RC+Np/k11NxyPDMXUzJiKiXPzuHuFQ3Nv5GOr4rvYnY+vYHha
	 UliTRER2yrEqDiyw9egeBe98/UpEbtTpCAH6a/UuoGu0xaz5PvG0Pkr4Gs91ejuB8zAmy
	 Ufq0SkTAfcNX+iROz8ETAVIjOd0LFT8LMkp8GQD75Hpjsp8tcKCQF3fu5XczaHaLkSv1B
	 3m3wf2PDqYWQE62EwQxln9GEPVhZH0TLCxf55kThOBozuguj0kOlUCrAJsl7HlDkhbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=bRLmGpMn;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA76606A31C;
	Tue, 17 Nov 2026 14:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBA76606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=bRLmGpMn
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55020e75a;
	Tue, 17 Nov 2026 22:43:27 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Boon Khai Ng <boon.khai.ng@altera.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net 1/2] net: altera: Fix potential use-after-free on removal
Date: Tue, 17 Nov 2026 22:43:26 +0800
Message-ID: <20261117-571e631490-net-1@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117-571e631490-net-0@mail.sdu.edu.cn>
References: <20261117-571e631490-net-0@mail.sdu.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1e9f67c3703a1kunmc292039a1560a3
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTElOVkkZTx1LS0JKH0gaTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=bRLmGpMnxPlg4oBfB8QNGEFxYca0M+A2Bm4W4johpcFAuNQS+FMpbySiRoPOMWH9rTCiC4cS8QRuNQgf60QvaAx/KnFOfz0c7cox5jkEzubGXpFZMSGiFcCmTujlsoKODvWeoc1+CUR2np6GB5QAFHQAksxU4miXnGItXfZ3lHg=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=UvCn8QYH1wFV9fdIIhLnz86KR/yEzQGClFZbRaOTEFI=;
	h=date:mime-version:subject:message-id:from;

Destroying the MDIO bus before unregistering a running network device
leaves its PHY attached to a freed bus. The subsequent shutdown path
calls phylink_disconnect_phy(), which can access that bus.

Unregister the network device before destroying the MDIO bus.

This issue was found by our static analysis tool under development.

Fixes: bbd2190ce96d ("Altera TSE: Add main and header file for Altera Ethernet Driver")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/net/ethernet/altera/altera_tse_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
index 9eed0be4411e..e203f9fcb5d7 100644
--- a/drivers/net/ethernet/altera/altera_tse_main.c
+++ b/drivers/net/ethernet/altera/altera_tse_main.c
@@ -1461,8 +1461,8 @@ static void altera_tse_remove(struct platform_device *pdev)
 	struct altera_tse_private *priv = netdev_priv(ndev);
 
 	platform_set_drvdata(pdev, NULL);
-	altera_tse_mdio_destroy(ndev);
 	unregister_netdev(ndev);
+	altera_tse_mdio_destroy(ndev);
 	phylink_destroy(priv->phylink);
 	lynx_pcs_destroy(priv->pcs);
 
-- 
2.43.0

