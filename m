Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926934;
	b=F0uGPnbPVSLwZageI+SoO5pCm1SCMs7yYBUcSr8Az+sZJ/flE52sC1ESMdhvfUhv4cx7
	 0WveVIqiDS0kB0G5tP3M6RHcydDxIDCShoKjBcFKIv10XbhCs4y1/FY8HqGCbhul/lKfe
	 dmxs3OGekbJHCrrkupb/NBeroBW9PMoLnNf+EZeYrF4jrJSz9OkSg544QT306wVDfH2Ce
	 kdJn4+hnqMBR8MCtR3kS9s8yipSh5rVgHxY8obhds0//Ze/OFhHgRM79sRp3WrPUXd3Un
	 84C2HbWCgzrmp2PG42TDMDGFLfxOuIzt4TpFZnKK52rQCNHmi779lQC0f4Tap7STBbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926934;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-HM-Tid:
	 X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=wq3L7CVQUzhiYGcq5Umlktwmr+nGcj2X2cywevrWa94=;
	b=fpkLYO9Ps+GOjNEr977jNbvjwkFhxf+EUbk8Q/belbIVMTDhhwi6a6cOHRtlWmtQ19UC
	 xibzAPbeYo0GGz0sU1KNKq6ZeO8UD16Gb6BZIlTN+j2jZsmYk81vZ1G1fVHZ/vx72bzeg
	 D2uPQ3D6kuOoRoNeQ+tDpzqSw6dNs5uHvFJ/c4cDFkTAcx/2YFEsItqo6v6/F/hkDphm8
	 p6dauuBQmogWpkpdOWDWiDk9mGWM8it8Tp7AQ1xA+IHOCVIB2aYTlV4OkakJZmqtPh7PC
	 3LzikdE/jILWFM9REsa+NKuJvXlxaZMs8Uc6c3gxJ75eknWKP0VJz5Q3Eeyngf5AFYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=GG5dgskb;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71D4606A32A;
	Tue, 17 Nov 2026 14:48:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E71D4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=GG5dgskb
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55020e7e8;
	Tue, 17 Nov 2026 22:48:46 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Jeremy Kerr <jk@codeconstruct.com.au>,
	Matt Johnston <matt@codeconstruct.com.au>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] mctp: i3c: Fix potential thread leak on registration failure
Date: Tue, 17 Nov 2026 22:48:45 +0800
Message-ID: <20261117-571e631490-mctp-i3c-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
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
X-HM-Tid: 0aa1e9fb5c1f03a1kunm36b1c76b156473
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTRlJVkNNGU1NSxoaQxhPHlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=GG5dgskbVJap7bA65teDSSUQKGRwJ4F63EmTuncrDDtjQoJ+6FrpX2iTHkSW6/JBC8Gka+yAdJD6q5wRhCmQsSW3MaS6d4HzwLYAjQuL3U/XIF/0OD2Kb9J05ONkFRyKwEk1oR7tNln6EEwVSOTdMASdPudziAuyxKWIlDg7cRo=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=wq3L7CVQUzhiYGcq5Umlktwmr+nGcj2X2cywevrWa94=;
	h=date:mime-version:subject:message-id:from;

mctp_register_netdev() can fail before netdev registration begins,
leaving the TX thread and bus list entry allocated. The error path
assumes ndo_uninit has already cleaned them up.

Always clean up on registration failure. Make bus cleanup idempotent
because later registration failures can already have called ndo_uninit.

This issue was found by our static analysis tool under development.

Fixes: c8755b29b58e ("mctp i3c: MCTP I3C driver")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
 drivers/net/mctp/mctp-i3c.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/mctp/mctp-i3c.c b/drivers/net/mctp/mctp-i3c.c
index 5f225999d715..2d55ca88f0a8 100644
--- a/drivers/net/mctp/mctp-i3c.c
+++ b/drivers/net/mctp/mctp-i3c.c
@@ -492,7 +492,8 @@ __must_hold(&busdevs_lock)
 	}
 
 	kfree_skb(mbus->tx_skb);
-	list_del(&mbus->list);
+	mbus->tx_skb = NULL;
+	list_del_init(&mbus->list);
 }
 
 static void mctp_i3c_ndo_uninit(struct net_device *ndev)
@@ -624,7 +625,7 @@ __must_hold(&busdevs_lock)
 	rc = mctp_register_netdev(ndev, NULL, MCTP_PHYS_BINDING_I3C);
 	if (rc < 0) {
 		dev_warn(&ndev->dev, "netdev register failed: %d\n", rc);
-		goto err_free_netdev;
+		goto err_free_uninit;
 	}
 	return mbus;
 
@@ -634,7 +635,6 @@ __must_hold(&busdevs_lock)
 	 */
 	mctp_i3c_bus_free(mbus);
 
-err_free_netdev:
 	free_netdev(ndev);
 
 err:

base-commit: 2e54b3e187300893688c2c7517894f5d96732e05
