Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=68.232.154.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919799;
	b=UnPQDxQhRu6EhsC5+0zqdwj/H/FQdjy0VeUWCqTdx+57BMt2t8yV9h4S5nV1/z4u9CLs
	 gRR6ji936+o+Kb6Qsi3O0nQRrCY+VS8O4Yobtu5KK3fMv1ZrlH45ehoeHz6bEYHI9yxOR
	 WzNPaDWmQICT/JdLH03+rBd7hc9DR95syXwmhuxrkMXJzsTcYK3ekDc2w+celOdJ6hjv8
	 kbXctKR457eOAw6iEBVYT5goaPflpbj/n7gYViU0W6DY9JH0s6aoVM5/Get8tWBWG4Zst
	 v70TlsiHPgwmrK3H0p7Mt7xpxqhNwJLqvPjeY2CU1mvNHOGUHKzUEkQEPEYO/rQzBGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919799;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-Amp-Result:Received:Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-ID:X-B4-Tracking:X-Change-ID:To:CC:X-Mailer;
	bh=Vvk9cMzeKTtZ7S4jqj1+Kkd39OaGgZH54/2zezoZsLA=;
	b=OM2HIwmy5ZqIkC0ZWkt360lv14Cyss6GV6BNZKa1dfjHntCmvLlJ4uX5JaM+k5FjTKBA
	 BHdyXbBR7oOB+kgWb21IazaapSjKyH0+Ve/2SKGvuhzW1HsyEr8KdoJ6SPw4u2Jj/u0Cu
	 ZIAmwYNvRMN91bSFsJW7tMZjqbn6gZDBJboA4oT/4QTWq8IUd3aZ7TLYR9kCYKoAqJ6Yq
	 Pi+6HkOF5aH5B3UnNa8ekF6jbj0N+BtxoX09J3T5bs4cti859G3DlSZRlg1XguBg1SjiZ
	 CaU4BxYDRJ/kQhFb/N9MgxuysWOWq69vX79N5iyKSU2MkRGmIgaTW3bnCcIzA/0aZNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=microchip.com;
	spf=pass smtp.mailfrom=microchip.com;
	dkim=pass header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=1HPGMc2l;
	arc=none smtp.remote-ip=68.232.154.123
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF90606A31C;
	Tue, 17 Nov 2026 12:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CF90606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=1HPGMc2l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1794919807; x=1826455807;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=QxMlP43FIQ9UmHSP4knnwZ+AVDfoordYqDHuI+PDCyM=;
  b=1HPGMc2le7Oc9KK/8iiR2VbJQwEzJ9E8cWK8YZZ0Gzsx5sPpdQ6NcUxU
   BJyV3qNc54tTbtudfm1Zy3dmULiR2F9ZWjE9Q97mWWiqCMYSflKB6Akcd
   kEsGtyXcSMLvBDSat6nnxnS8mm0ayIc4QwG/RceB6c3E4GAVqT/oLAeLc
   itlETH5OX1AzXVMRSayxo4GJPsPE+ebafn4GAMy7DBiUh12XtNbn6QaKi
   0nj6/xx9jlStcr+91kb6O4rSogHv2kcXKuijIVhQ2Zto5piJMLVdMoQAP
   7Ax05l8VUEabBWQnrtDCwCVrutIiyG5vzPhgKUnjYVFxexnzzDX5fruC9
   A==;
X-CSE-ConnectionGUID: v146WzhHQIOW8VkWUI0tFg==
X-CSE-MsgGUID: inMAtMu3Rd6+AWwJX0pX9A==
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="66869287"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Nov 2026 05:50:01 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Tue, 17 Nov 2026 05:49:52 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Tue, 17 Nov 2026 05:49:50 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Tue, 17 Nov 2026 13:49:50 +0100
Subject: [PATCH net-next] net: lan966x: free the RX pages when the TX
 allocation fails
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261117-lan966x-rx-pages-tx-alloc-fail-v1-1-13f310d66650@microchip.com>
X-B4-Tracking: v=1; b=H4sIAG1N/GoC/x3NwQrCMAyA4VcZORswxRX1VcRD3NIZKNloywiMv
 bvF43f5/wOqFJUKz+GAIrtWXa2DLgNMX7ZFUOduCNcQiShiZnvE6FgcN16kYnPknNcJE2vG8Ln
 LjUKiMQXoka1IUv8PXmDS0MQbvM/zB7Xkjcd6AAAA
X-Change-ID: 20261116-lan966x-rx-pages-tx-alloc-fail-2b8e412f15f2
To: Horatiu Vultur <horatiu.vultur@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>, Daniel Machon
	<daniel.machon@microchip.com>
X-Mailer: b4 0.14.3

lan966x_fdma_init() allocates the RX ring and fills its DCBs with pages
from the RX page pool, then allocates the TX ring. If the TX allocation
fails, the error path frees the RX ring and destroys the page pool, but
does not return the pages to the pool first.

The pool then never finishes its shutdown, and page_pool_release_retry()
keeps warning about the pages still in flight.

To let the pool shut down, return the RX pages before destroying it, as
lan966x_fdma_deinit() does. lan966x_fdma_rx_alloc() does not check that
every DCB got its pages, so skip the entries that are still empty.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
index 1fbe910c5ec38..586ee648c7741 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
@@ -54,9 +54,11 @@ static void lan966x_fdma_rx_free_pages(struct lan966x_rx *rx)
 	int i, j;
 
 	for (i = 0; i < fdma->n_dcbs; ++i) {
-		for (j = 0; j < fdma->n_dbs; ++j)
-			page_pool_put_full_page(rx->page_pool,
-						rx->page[i][j], false);
+		for (j = 0; j < fdma->n_dbs; ++j) {
+			if (rx->page[i][j])
+				page_pool_put_full_page(rx->page_pool,
+							rx->page[i][j], false);
+		}
 	}
 }
 
@@ -999,6 +1001,7 @@ int lan966x_fdma_init(struct lan966x *lan966x)
 
 	err = lan966x_fdma_tx_alloc(&lan966x->tx);
 	if (err) {
+		lan966x_fdma_rx_free_pages(&lan966x->rx);
 		fdma_free_coherent(lan966x->dma_dev, &lan966x->rx.fdma);
 		page_pool_destroy(lan966x->rx.page_pool);
 		return err;

---
base-commit: 994089a3fa3882f27f4bed9fc5815ee7df502e88
change-id: 20261116-lan966x-rx-pages-tx-alloc-fail-2b8e412f15f2

Best regards,
-- 
Daniel Machon <daniel.machon@microchip.com>

